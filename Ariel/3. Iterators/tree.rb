tree = ['A' , 
            ['B',
                ['D', nil, nil],
                nil
            ],
            ['C',
                ['E',
                    ['G',
                        ['I', nil, nil],
                        ['J',nil, nil]
                    ],
                    ['H',
                        nil,
                        ['K', nil, nil],
                ],
                'F', nil, nil]
            ]
        ]
                
class TreeTransersla
    def depth_first(root)
        Enumerator.new do |yielder|
            @yielder = yielder
            recursive_aux(root)
        end
    end
        
    def breath_first(root)
        Enumerator.new do |yielder|
            queue = [root]
            while !queue.empty?
                x = queue.shift
                if !x.nil?
                    queue.push(x[1])
                    queue.push(x[2])
                    yielder << x[0]
                end
            end
        end
    end
    
    private
    
    def recursive_aux(root)
        if !root.nil?
            @yielder << root[0]
            recursive_aux(root[1])
            recursive_aux(root[2])
        end
    end
end

tree_traversal = TreeTransersla.new
p tree_traversal.depth_first(tree).to_a
p tree_traversal.breath_first(tree).to_a
