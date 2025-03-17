Return-Path: <SRS0=NQ2g=WE=gmail.com=cole.mypackagingpro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD076C282EC
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Mar 2025 19:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 681FAC4CEED; Mon, 17 Mar 2025 19:59:06 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9367DC4CEE3
	for <linux-firmware@kernel.org>; Mon, 17 Mar 2025 19:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9367DC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30c091b54aaso44908721fa.3
        for <linux-firmware@kernel.org>; Mon, 17 Mar 2025 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742241543; x=1742846343; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cBpzFwJmJEVqUvJjqlNO7sCN10L5t++RBcVCI4+0VGE=;
        b=C7J6UmeTKPgNI5qJ62Ukvz89vXtsn5cGywL3+B2ccJM+/0vU108mrOjk3S75q7sXHh
         YMYybbAfTI0MeSTL2yumg1BtYml5yRW4DitOkd6AQjiemCTY3IWzF/LaUczXYZIftrAS
         HPCjnBHNCxLmVfVx4jcMoi8xV0aCs0AJ6zTey9KX0GEjJkNd0jn0T80U4E7gMB+7qRkM
         e56KDoTMzlu3zkoNS+vyEDstQfuM5XU5XWITgIaETCa/INpuckKtdhU7l+zBOnp3qdVj
         yZ82rvh3F4d4HFbnyxn75eS8R7vIWL5tcd92wGN6P++YCdrLzWovBj0g4s2Disb4K9vv
         3cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742241543; x=1742846343;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBpzFwJmJEVqUvJjqlNO7sCN10L5t++RBcVCI4+0VGE=;
        b=N8ofn0JhirxAkPBrKTavp+XRfDsngTNasu7/OQ4nsGEanrm61390p2Aqb2ZHQmbuOh
         jaRk2bYBNXFLy5DVfjTbi1fPFlN5RVyQZkxHpyJcZk+kPVgS0z9YZlLi83RzVvst9T9T
         CA/xtko2m4pQOwmorqvsrwy8HEfuAp4/jKoXs5gUuxWoZpgbE5SF68QrRQbQ0JfVqivO
         HxepjywoS+FiS9axpMEG1Ck/7Ph8SQFd6HHdJELg48hmMilJbqPYoFjJsI6sWF/1j8iW
         /SmTDGeNHIy5MT0w9F5sZOQDudPAfPrm5Qo0U/rTY7pin/H+5xYU7PwSv9JQh5JiaXs9
         NpIw==
X-Gm-Message-State: AOJu0YyhfBL8i3kAEqOic8I+rfA9C5YS9kB8FyXykvewbVZmFi/0wnQc
	tCz81bmjD0/hJxYZ6gKO9jMks91l4iH4rexDqtY1p2EOHgMgq0PWZcX8bqdOhpyUh3gQPMLHJfc
	Gb+d/EvjoPl8bmCL/r73dpOYaVCXdhA==
X-Gm-Gg: ASbGncvwXSiAbMExx+pg9Fdb+hgrS7fNeh5hahuaDcakFXAnkOtCTewtUtCMbCv8bBz
	yyfmA8bswAZUVm3tHF591DuMHcOVR7S4VW+A4bvfn6rhIJREv3I4DgFiJ51V6YhrPqhA/puGScD
	pPc1D+tH0wQBUyYIHiLIsKJEGKxw==
X-Google-Smtp-Source: AGHT+IEiDx6LBXr0ppaxRyjYlVAgLQI4duLddYgY75eLzTsdYoDjlS38zgFkgar4aNYpcEzcxCpAtKBNYCX78qFZO48=
X-Received: by 2002:a05:651c:19a5:b0:308:df1e:24c4 with SMTP id
 38308e7fff4ca-30c9a9281eamr10254061fa.29.1742241543311; Mon, 17 Mar 2025
 12:59:03 -0700 (PDT)
MIME-Version: 1.0
From: Cole Everett <cole.mypackagingpro@gmail.com>
Date: Mon, 17 Mar 2025 12:58:52 -0700
X-Gm-Features: AQ5f1JqhXh-vw4JtITBG58p6Ae9koMutt30bgFS4grZvLG6LkXWetLl2vhe5lUY
Message-ID: <CAD1xCkPPb_xUx5oej4zwprZS5htkgmySdjNawjDU0qUj8sBVag@mail.gmail.com>
Subject: Quote for Custom Packaging
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="0000000000004d589706308f3889"

--0000000000004d589706308f3889
Content-Type: text/plain; charset="UTF-8"

Hi,

I hope you are well.

We are a packaging company. We provide custom packaging boxes/labels in
every size, stocks and styles such as tuck boxes, rigid boxes, mailer
boxes, retail boxes, shopping bags or any other box as well.

Send your packaging details (Size: L W H), quantity and box style so we can
assist you.

Let me know if you have any questions or any job you would like to try us
on. Thanks.


Best regards,
Cole Everett
My Packaging Pro.

--0000000000004d589706308f3889
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br>=C2=A0<br>I hope you are well.<br>=
=C2=A0<br>We are a packaging company. We provide custom packaging boxes/lab=
els in every size, stocks and styles such as tuck boxes, rigid boxes, maile=
r boxes, retail boxes, shopping bags or any other box as well.<br>=C2=A0<br=
>Send your packaging details (Size: L W H), quantity and box style so we ca=
n assist you.<br>=C2=A0<br>Let me know if you have any questions or any job=
 you would like to try us on. Thanks.<br>=C2=A0<br>=C2=A0<br>Best regards,<=
br>Cole Everett<br>My Packaging Pro.<br></div></div>

--0000000000004d589706308f3889--
