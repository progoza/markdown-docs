When the space on the phone is running out, usually it is becuase we have a lot of pictures on it. They can take tons of GB of space, as today's phones record quite high-quality pictures (usually 3-5 MB per picture) But - as a matter of fact - to view these images on a small phone screen it is enough to have 2x smaller picture and it still looks ok (then the pictures usually weight <1MB). 

This is the way how I  bulk-resize the pictures from the phone:

1. Copy the DCIM/Camera directory from the phone to PC
2. Backup the files on storage, so that I keep the original pictures.
3. On PC, go to the directory where the pictures were copied and run:

```
find . -iname "*.JPG" -exec mogrify -resize 50% {} \;
```

Note: The **convert** program is a member of the [imagemagick](https://linux.die.net/man/1/imagemagick) suite of tools.

4. After the resize it is also worth to fix the files modification date/time. I do it by copying the date of taken the picture from EXIF:

```
find . -iname "*.JPG" -exec exiftool '-FileCreateDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal'  {} \;
```

Note: exiftool can be installed: on ubuntu `sudo apt install exiftool` on arch - package `perl-image-exiftool`.

5. Remove all `*.JPG` files  from the phone's DCIM/Camera directory
6. Copy the resized pictures from PC to a different folder on the phone, e.g. to `DCIM/Camera_yyyymmdd` directory.

Tons of space is now recovered on the phone.
BTW: more space can be saved by doing the same with videos (mp4s), e.g. by resizing 4K to full-hd or even 720p. For that I don't have cmd-line workflow so far. I use `handbrake`. 

PS. Probably there are some andriod/ios apps out there that do similar thing, but I prefere to control what is going on with my data (and I keep backup copy of original files in I need a hi-res picture for any rason).

