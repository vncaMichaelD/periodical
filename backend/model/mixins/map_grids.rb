module MapGrids

  def self.included(base)
        base.one_to_many :map_grid

        base.def_nested_record(:the_property => :map_grids,
                               :contains_records_of_type => :map_grid,
                               :corresponding_to_association => :map_grid)
  end

end
