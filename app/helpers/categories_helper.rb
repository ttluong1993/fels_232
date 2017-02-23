module CategoriesHelper
  def order_options
    [[t(".a_z"), "name_asc"], [t(".z_a"), "name_desc"], [t(".recently"), "recently"],
      [t(".most_learned"), "most_learned"]]
  end
end
