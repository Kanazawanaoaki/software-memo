(if (not (boundp '*irtviewer*)) (make-irtviewer))
#|
  手先の座標phは肩のローカル座標系paで定義されている．
  初期姿勢ではワールド座標系とaは平行になっている．
  肩と一緒にpaが回転すると，phもそれと一緒に回転する．
|#
(setq pa (make-cascoords :pos #f(0 400 1600)))
(setq ph (make-cascoords :pos #f(0 400 1000)))
(send pa :assoc ph)
(objects (list pa ph *world-coords*))
(send pa :rotate (deg2rad 45) :x)
(send *irtviewer* :draw-objects)
;; ちなみにアニメーションさせてみると以下のようになる．
(do ((i 0 (+ i 1)))
    ((> i 90))
    (send pa :orient (deg2rad i) :x :world)
    (send *irtviewer* :draw-objects))
