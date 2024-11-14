# -*- coding: utf-8 -*-
class Parser:
    def __init__(self, file_path):
        """
        Opens the input file and gets ready to parse it.
        """
        with open(file_path, 'r') as file:
            self.commands = []
            for line in file:
                # Remove comments
                comment_idx = line.find('//')
                if comment_idx != -1:
                    line = line[:comment_idx]
                
                # Remove whitespace
                line = line.strip()
                
                # Ignore empty lines
                if line:
                    self.commands.append(line)
                    
        self.current_command = None
        self.current_index = -1
        
    def hasMoreCommands(self) -> bool:
        """Are there more commands in the input?"""
        return self.current_index < len(self.commands) - 1
        
    def advance(self):
        """Reads the next command and makes it the current command"""
        if self.hasMoreCommands():
            self.current_index += 1
            self.current_command = self.commands[self.current_index]
            
    def commandType(self):
        """
        Returns the type of the current command:
        A_COMMAND - @Xxx where Xxx is either a symbol or decimal number
        C_COMMAND - dest=comp;jump
        L_COMMAND - (Xxx) where Xxx is a symbol
        """
        if not self.current_command:
            return None
            
        if self.current_command.startswith('@'):
            return 'A_COMMAND'
        elif self.current_command.startswith('('):
            return 'L_COMMAND'
        else:
            return 'C_COMMAND'
            
    def symbol(self):
        """
        Returns the symbol or decimal of the current command @Xxx or (Xxx)
        Should only be called when commandType is A_COMMAND or L_COMMAND
        """
        if self.commandType() == 'A_COMMAND':
            return self.current_command[1:]  # Remove @
        elif self.commandType() == 'L_COMMAND':
            return self.current_command[1:-1]  # Remove ()
        return None
        
    def dest(self):
        """
        Returns the dest mnemonic in the current C-command
        Should only be called when commandType is C_COMMAND
        """
        if self.commandType() != 'C_COMMAND':
            return None
            
        if '=' in self.current_command:
            return self.current_command.split('=')[0]
        return None
        
    def comp(self):
        """
        Returns the comp mnemonic in the current C-command
        Should only be called when commandType is C_COMMAND
        """
        if self.commandType() != 'C_COMMAND':
            return None
            
        command = self.current_command
        if '=' in command:
            command = command.split('=')[1]
        if ';' in command:
            command = command.split(';')[0]
        return command
        
    def jump(self):
        """
        Returns the jump mnemonic in the current C-command
        Should only be called when commandType is C_COMMAND
        """
        if self.commandType() != 'C_COMMAND':
            return None
            
        if ';' in self.current_command:
            return self.current_command.split(';')[1]
        return None

if __name__=="__main__":
    parser = Parser("add/Add.asm")
    while parser.hasMoreCommands():
        parser.advance()
        print(f"Command Type: {parser.commandType()}")
        if parser.commandType() == 'A_COMMAND':
            print(f"Symbol: {parser.symbol()}")
        elif parser.commandType() == 'C_COMMAND':
            print(f"dest: {parser.dest()}")
            print(f"comp: {parser.comp()}")
            print(f"jump: {parser.jump()}")
