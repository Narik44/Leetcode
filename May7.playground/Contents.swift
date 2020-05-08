import Foundation
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) {
        self.val = val;
        self.left = nil;
        self.right = nil;
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {    self.val = val
        self.left = left
        self.right = right
    }
}




class Solution {
    var dict:[Int: Int] = [:]
    var flag = false
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        if let root = root {
            caluculateDepth(node: root, depth: 0,x,y)
        } else{
            return false
        }
        if dict[x] == dict[y] ,flag == false {return true}
        return false
        
    }
    
    func caluculateDepth(node: TreeNode, depth:Int,_ x: Int,_ y:Int) {
        dict[node.val] = depth
        if node.left == nil , node.right == nil {
            return
        }
        if(node.left?.val == x && node.right?.val == y || node.left?.val == y && node.right?.val == x ){
            flag = true
        }
        if node.left != nil {
            caluculateDepth(node: node.left!, depth: depth+1,x,y)
        }
        if node.right != nil {
            caluculateDepth(node: node.right!, depth: depth+1,x,y)
        }
    }
}

