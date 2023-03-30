require_relative './node'
require 'pry'

class LinkedList
    attr_accessor :head

    def initialize 
        @head = nil
    end

    def append node
        if head.nil? 
            self.head = node
            return
        end

        last_node = head
        while last_node.next_node
            last_node = last_node.next_node
        end
        last_node.next_node = node 
    end

    def prepend node
        old_head = head
        self.head = node
        head.next_node = old_head
    end

    def delete_head
        if self.head.nil?
            return
        end
        old_head = self.head
        @head = old_head.next_node
        old_head.next_node = nil
    end

    def delete_tail
        if self.head.nil?
            return
        end
        
        last_node = @head
        if head.next_node == nil
            self.delete_head
        else
            until last_node.next_node.next_node == nil
                last_node = last_node.next_node
            end
        end
        last_node.next_node = nil
    end

    def search node
        target = @head 
        return false if !target.next_node 
        return target if target.data == node 

        while target = target.next_node 
            return target if target.data = node
        end
    end

    def add_after(index, node)
        counter = 0
        current_node = @head
        until counter == index
            current_node = current_node.next_node unless current_node.next_node == nil
            counter +=1
        end
        if current_node.next_node == nil
            current_node.next_node = node
        else
            current_node.next_node = @connect_node
            current_node.next_node = node
            node.next_node = @connect_node
        end
    end

end
