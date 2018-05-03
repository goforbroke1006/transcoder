### Requirements

    apt-get install -y ffmpeg --devel --with-libvpx --with-opus --enable-libmp3lame --enable-libshine

    add-apt-repository ppa:ffmulticonverter/stable
    apt-get update
    apt-get install ffmulticonverter

### Useful links

* [Video formats list](https://en.wikipedia.org/wiki/Video_file_format)

### Target

* webm
* ogg
* mp4

        ffmpeg -i sourcevideo.mp4 -vcodec libvpx -acodec libvorbis -aq 5 -ac 2 -qmax 25 -b 614400 -s 1280×720 Outputvideo.webm

### Target video codings

* VP8
* VP9
* Theora
* Dirac

### Target audio formats

* Vorbis
* Opus
* FLAC

### Unsupported formats

* mpg

        ffmpeg -y -i in.mpg out.webm
        ffmpeg -y -i in.mpg out.mp4

* mts

        ffmpeg -y -i in.mts out.webm
        ffmpeg -y -i in.mts out.mp4

* mkv

        ffmpeg -i input.flv -vcodec libvpx -acodec libvorbis output.webm
        ffmpeg -i input.mp4 -c:v libvpx -b:v 1M -c:a libvorbis output.webm
        ffmpeg -i input.mp4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis output.webm
        ffmpeg -i -f webm -vcodec libvpx -acodec libvorbis output.webm
        ffmpeg -i ironman2trailer.mkv -vcodec copy -acodec copy -absf aac_adtstoasc output.mp4
        ffmpeg -i LostInTranslation.mkv -codec copy LostInTranslation.mp4
        ffmpeg2theora in_file.mkv -o out_file.ogg

* flv

        ffmpeg -y -i in.flv out.webm
        ffmpeg -y -i in.flv out.mp4

* vob

        ffmpeg -i ete2012.vob -b 500k -s 640x480 -ab 64k -vcodec libvpx -acodec libvorbis ete2012.webm
        ffmpeg -i outss.VOB -acodec libmp3lame -ac 2 -ar 22050 video.mp4
        ffmpeg -i input.vob -c:v copy -c:a copy output.mpg
        ffmpeg -i input.vob -c:v libx264 -c:a aac -strict experimental output.mp4
        ffmpeg -i ete2012.vob -b 500k -s 640x480 -ab 64k -vcodec libx264 -acodec aac -strict experimental ete2012.mp4
        ffmpeg -i ete2012.vob -vcodec libtheora -b 400k -s 640x480 -acodec libvorbis -ab 64k ete2012.ogv

* ogv
* avi

        ffmpeg -y -i in.avi out.webm
        ffmpeg -y -i in.avi out.mp4
        ffmpeg -i neha.avi -acodec libvorbis output.ogg
        ffmpeg -i neha.avi -acodec libvorbis -ab 192000 -b 1200kb output.ogg

* mov

        ffmpeg -y -i in.mov out.webm
        ffmpeg -y -i in.mov out.mp4
        ffmpeg -i sourcevideo.mov -vcodec copy -acodec copy Outputvideo.mp4
        ffmpeg -i sourcevideo.mov -acodec libvorbis -vcodec libtheora -ac 2 -ab 96k -ar 44100 -b 819200 -s 1080×720 Outputvideo.ogv
    

* wmv
* 3gp

        ffmpeg -y -i in.3gp out.webm
        ffmpeg -y -i in.3gp out.mp4
    

* 3g2


