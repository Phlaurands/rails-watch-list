class BookmarksController < ApplicationController
    def new
        @bookmark = Bookmark.new
    end
    
    def create
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new(bookmark_params)
        # @bookmark.list = @bookmark
        if @bookmark.save
          redirect_to list_path(@list)
        else
          render "lists/show"
        end
    end

    def delete
        @bookmark = Bookmark.find(params[:id])
        @bookmark.destroy
    end

    private

    def bookmark_params
        params.require(:bookmark).permit(:comment)
    end
end
