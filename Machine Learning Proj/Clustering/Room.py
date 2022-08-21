import numpy as np
import matplotlib.pyplot as plt 
from copy import deepcopy

class Room():
    def __init__(self, size=None, goal_num=1, obstacle_num=0):
        """
            create grid world with given size
        """
        self.world_size = (7, 7) if size is None else size
        self.robot_pos = None
        self.goal_pos = None
        self.goal_num = goal_num
        self.action_space = 4
        self.obstacle_num = obstacle_num
        
        grid_state_num = self.world_size[0] * self.world_size[1]
        goal_state_num = grid_state_num + 1
        
        self.state_space = list(goal_state_num for _ in range(self.goal_num))
        self.state_space.insert(0, grid_state_num)
        
        self.all_pos = dict()
        for i in range(self.world_size[0]):
            for j in range(self.world_size[1]):
                self.all_pos[(i, j)] = 1
        
        # select trapped obstacles 
        self.obstacle_pos = np.zeros((self.obstacle_num, 2), dtype="int")
        for idx in range(self.obstacle_num):
            obstacle_candidate = np.random.randint(0, self.world_size[0]-1, size=(2,))
            while not self.all_pos[tuple(obstacle_candidate.tolist())] == 1:
                obstacle_candidate = np.random.randint(0, self.world_size[0]-1, size=(2,))
            self.all_pos[tuple(obstacle_candidate.tolist())] = 0
            self.obstacle_pos[idx] = obstacle_candidate
    
    def reset(self):
        """
            reset the grid world with random robot position and goal location
        """
        # get no obstacle feasible positions
        self.feasible_pos = deepcopy(self.all_pos)
        self.goal_reached = np.zeros((self.goal_num,))
        
        # select goal positions
        self.goal_pos = np.zeros((self.goal_num, 2), dtype="int")
        for idx in range(self.goal_num):
            goal_candidate = np.random.randint(0, self.world_size[0]-1, size=(2,))
            while not self.feasible_pos[tuple(goal_candidate.tolist())] == 1:
                goal_candidate = np.random.randint(0, self.world_size[0]-1, size=(2,))
            self.feasible_pos[tuple(goal_candidate.tolist())] = 0
            self.goal_pos[idx] = goal_candidate
        
        # select robot inital positions
        self.robot_pos = np.random.randint(0, self.world_size[0]-1, size=(2,))
        while not self.feasible_pos[tuple(self.robot_pos.tolist())] == 1:
            self.robot_pos = np.random.randint(0, self.world_size[0]-1, size=(2,))
        self.feasible_pos[tuple(self.robot_pos.tolist())] = 0
        
        states = list()
        robot_state = self.robot_pos[0] * self.world_size[0] + self.robot_pos[1]
        states.append(robot_state)
        for goal in self.goal_pos:
            goal_state = goal[0] * self.world_size[0] + goal[1]
            states.append(goal_state)
        return states
    
    def step(self, action):
        """
            make the robot move one step according to action
        """
        if action == 0:
            self.robot_pos[0] += 1
        elif action == 1:
            self.robot_pos[1] += 1
        elif action == 2:
            self.robot_pos[0] -= 1
        elif action == 3:
            self.robot_pos[1] -= 1
        
        reward = 0.0
        done = False
        
        if self.robot_pos[0] < 0:
            self.robot_pos[0] = 0
            reward -= 0.01
        elif self.robot_pos[0] > self.world_size[0]-1:
            self.robot_pos[0] = self.world_size[0]-1
            reward -= 0.01
        
        if self.robot_pos[1] < 0:
            self.robot_pos[1] = 0
            reward -= 0.01
        elif self.robot_pos[1] > self.world_size[1]-1:
            self.robot_pos[1] = self.world_size[1]-1
            reward -= 0.01
            
       
        # goal reward
        for idx, goal in enumerate(self.goal_pos):
            if np.allclose(self.robot_pos, goal):
                if self.goal_reached[idx] == 0:
                    reward += 1.0
                    self.goal_reached[idx] = 1
        if np.all(self.goal_reached == 1):
            done = True
        # obstacle penalty
        for obstacle in self.obstacle_pos:
            if np.allclose(self.robot_pos, obstacle):
                reward -= 1.0
                done = True
        # time penalty
        reward -= 0.01
        
        states = list()
        robot_state = self.robot_pos[0] * self.world_size[0] + self.robot_pos[1]
        states.append(robot_state)
        for idx, goal in enumerate(self.goal_pos):
            if self.goal_reached[idx] == 0:
                goal_state = goal[0] * self.world_size[0] + goal[1]
            else:
                goal_state = -1
            states.append(goal_state)
            
        return states, reward, done
    
    def render(self):
        plt.cla()
        plt.plot(self.robot_pos[0] + 0.5, self.robot_pos[1] + 0.5, linewidth=0, marker='o', markersize=18, color='g')
        for idx, goal in enumerate(self.goal_pos):
            goal_color = "b" if self.goal_reached[idx] == 1 else "r" 
            plt.plot(goal[0] + 0.5, goal[1] + 0.5, linewidth=0, marker='*', markersize=20, color=goal_color)
        for obstacle in self.obstacle_pos:
            plt.plot(obstacle[0] + 0.5, obstacle[1] + 0.5, linewidth=0, marker='s', markersize=30, color='k')
        plt.xticks(range(0, self.world_size[0]+1))
        plt.yticks(range(0, self.world_size[1]+1))
        plt.xlim([0, self.world_size[0]])
        plt.ylim([0, self.world_size[1]])
        plt.grid(color='k', linestyle='-', linewidth=1.0)
        ax = plt.gca()
        ax.set_aspect(1)
