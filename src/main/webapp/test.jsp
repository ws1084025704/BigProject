<div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
        <form action="upload" name='uploadForm' method="post" target="uploadFrame" enctype="multipart/form-data">
            <div class="form-group">
                <label>电影名称</label>
                <input type="text" class="form-control" name="story.movieName" placeholder="泰坦尼克号">
            </div>
            <div class="form-group">
                <label>情节故事</label>
                <input type="text" class="form-control" name="story.details" placeholder="巨轮在这里撞击了冰山">
            </div>
            <div class="form-group">
                <label>请选择上传的图片</label>
                <input type="file" class="form-control" name="myFile">
            </div>
            <input type="hidden" name="lng">
            <input type="hidden" name="lat">
            <div class="form-group">
                <input type="submit" class="login-close btn btn-info btn-lg btn-block" onclick="alert('上传成功')" value="确定信息">
            </div>
        </form>
    </div>
</div>