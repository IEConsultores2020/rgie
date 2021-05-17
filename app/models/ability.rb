class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      # user ||= User.new # guest user (not logged in)
      #user asigned for Input (Entradas) and Output (Salidas). IEOS
   

      #Users asigned for Diary Register On Terrain (DROT)      
       if user.admin?
          can :manage, :all
          can :import, User
       elsif user.seller?

          can :read, User
          can :read, Role
          can :read, Ciudad
          can :read, Articulo
          can :read, Modelo
          can :read, Componente
          can :read,  Medida
          can :read, Inventario
          can :read, Conteo

          can :update, Articulo #do |articulo|
            #Articulo.try(:user) == user
          #end
          can :update, Modelo
          can :update, Componente
          can :update, Medida
          can :update, Inventario
          can :update, Conteo

          can :create, Articulo
          can :create, Modelo
          can :create, Componente
          can :create, Medida   
          can :create, Inventario 
          can :create, Tienda 
          can :create, Conteo

          can :destroy, Inventario
          can :destroy, Conteo
          can :destroy, Articulo #do |articulo|
           # Articulo.try(:user) == user
          #end


          can :import, [Articulo, Inventario, Conteo]

        elsif user.regular?
          can :read, User
          can :read, Role
          can :read, Ciudad
          can :read, Region
          can :read, Articulo

          can :read, Planvisitum
          can :read, Visitum
          can :read, Ventum
        elsif user.adminaccount?         
          can :read, User
          can :read, Role
          can :read, Ciudad
          can :read, Region
          can :read, Planvisitum
          can :read, Puntoventum
          can :read, Visitum
          can :read, Ventum
         
       elsif user.supervisor?
         can :read, User
         can :read, Role
         can :read, Ciudad
         can :read, Region
         can :read, Planvisitum
         can :read, Visitum
         can :read, Ventum

         can :update, Planvisitum         
         can :update, Visitum

         can :create, Planvisitum
         can :create, Visitum

         can :destroy, Planvisitum          

       elsif user.merchandizer?
         can :read, User
         can :read, Role
         can :read, Ciudad
         can :read, Region
         can :read, Planvisitum
         can :read, Visitum
         can :read, Ventum         

         can :update, Planvisitum
         can :update, Visitum

         can :create, Visitum

       elsif user.promoter?
         can :read, User
         can :read, Role
         can :read, Ciudad
         can :read, Region         
         can :read, Planvisitum
         can :read, Visitum
         can :read, Ventum                 

         can :update, Visitum
         can :update, Ventum

         can :create, Visitum
         can :create, Ventum

         can :destroy, Visitum
        end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
