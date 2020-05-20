class MenuController < ApplicationController
    params.require(:menus).permit(:itemid, itemid: [])
end