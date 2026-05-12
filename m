Return-Path: <SRS0=/cET=DJ=gmail.com=gabbar.silver@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C359DCD4F24
	for <linux-firmware@archiver.kernel.org>; Tue, 12 May 2026 18:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2CC9C2BCC7; Tue, 12 May 2026 18:06:31 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2383C2BCB0
	for <linux-firmware@kernel.org>; Tue, 12 May 2026 18:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2383C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-42c126bc7feso674663fac.1
        for <linux-firmware@kernel.org>; Tue, 12 May 2026 11:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778609190; cv=none;
        d=google.com; s=arc-20240605;
        b=KMBRFS8ODGWXqZ7eKFOZHfcGDrSK51ZCcnwsRk1kWatp/DK9CybQeLTkFECc4XjrPz
         lMQ3/j0sNPRKcUc+wcvksJ/1Z2UXq4PM0XJtr+SpKB5/xHsymaQ9D/enV8Vw/o02k1Yj
         cvRmvXKmT1f8R2gZDpo28rzO5FeiNnoxosQutR3vCfYLbhktDJeWXULFUZofyiTTN/G6
         mxwpohZPWWTO8YFB+EIyBKcvlMrlGLHND734GdKxxljKlqEZiynXGRaro5z18zsmgfWf
         +Vp8jdkFfK+7CGaLj+arseEBSRDx7ZYyyyl2UPLYGI8kHbee//OaQjpzVU6Z+uVQ/nt3
         vIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aXcujKiA7bLxuHyJ4crvo8AxUGdkxgQxvrozwGhwnow=;
        fh=thzlYDAT27MWbzz3if4rQyeooyybPz7D/zeQezHlJZA=;
        b=Hvhp4FVqd8rzhNZLnRLekXDZDsqP2ooDwcIu1qnustt2btxHikm2d4Xhn9WORUVKVI
         /laAGNgVaCKa0wev6zk9dXo9ziKFutNqt30WX8kclkjo5D9CsBxIDoFEp55GpfLVp7y9
         dlzzWCk3iYf53QAb9BYAQ/ZxkdlqqqFF8q9QzqsNIiIP0lZsD/aIxR+q2i7dBcjdlR+A
         wI2QF0NUL4pL1JriU8VX418VzHW+2tRfhUKwyiIOaWvnAeGFgB6Szvp94pJ/y2zDdP4f
         eRILxrdIXn8xJiBxBuqt7ZQvprv4opMYTqenKeIfZABQ+qwdC9k+25ML+v8Jyh6KU+QS
         6Mow==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778609190; x=1779213990; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aXcujKiA7bLxuHyJ4crvo8AxUGdkxgQxvrozwGhwnow=;
        b=Ay3iWxrgOLt6zcIEwlyTIbyVcA4FuTRLnaDu7WQxZbIvJ+wBFoiaab+R5FK1fazqdK
         AVjN8x6DLOqg+25VhfuaaprU1cgg1pPOEuCgn1jFJZpHrr3XrsL9dg2zLFLjHk0pZOYd
         06DOe2mwT7pOeaKiwBFSW2ItK2J9jEGHDYG22Hx5aASjWR4jBCzrESaAlmVvYgzv4nbX
         pqQBHt6Xd9DMhHxeniijIe9BHzCK0HPh/1O/N8YOlEf62Bg8w1WDM28kFzdDt5CREeqR
         sOg8cP2Jmv3rZt4UC7RvW8Hqs1oaa6s5J9yVRJMhSguKX5E2B9U7HSMWGkgSyW2rbCLP
         KL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778609190; x=1779213990;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXcujKiA7bLxuHyJ4crvo8AxUGdkxgQxvrozwGhwnow=;
        b=ZziGawKaIceBVGpw249WzUtUb8+L458aRqVmDgUToSke55gQLJng9jkDGlueqUxrpx
         Kqir4aN2GiLk/rTmQZTHWDlQDiQLThs67ExRT+XPUkg2RNER7Ep3rD/wWnvS8HDm6rWl
         9dlDgScX/FdBKH+B6m9G/5Lj0X+/9Rq40Yrag5c8Favtxp8/nBnbHraoMQHH593ogOov
         goi6zil7lS3sL32OtQDKhbTCMmlLnMabCQMJpevQC7cLu01GbRsItK4EF0Yq7SLyW6Ms
         QvAZt98EBiSuR4qfhutWpjmOGlaTHSE4kibrLtnExHzdCx8KDtG3Dha73kMIFr4s1eEn
         iqtw==
X-Gm-Message-State: AOJu0YwdYtoOmIWPkwWszwjHrHqYz/LEXMZYWnOXAQYRU+x6ygAHnVTG
	ANGk3N9UZIQOySFReG2oQKNQouOtNBfRbzbC35MhBVMt1+Dfp+HjJSmCOspPlaIPoTRQNL7QNt3
	b6yQ362dp2iM08p/cp84lAmX6UyJ9tsHVu4RJ
X-Gm-Gg: Acq92OHytEm4oJaEMi47CdZ7MOi8DRJziDtn5iPN8oaGCF2D8jYZzyeoHEq343vqX5L
	DCG2bmDvDdo2zG6wbI+nz+jit6Zg4ncVC8nS7MjDRav86ynYsQTo1TtED88DvkSCNe3K1Coo7y9
	6z8TkLqiJl5xZ45/1ygp4y6nntfObcegCPSTjaC/fjozFzCTGKxL/xV9VVFsZVO5p1GU3XdxOgL
	OCK2sZbqC6+aMrzGd9aeC+v4htu3q41juO8O+nJCLcgfDSEy3ZgbYcYQy/3kbEkU555n4EYJ5y2
	R/WfXkWgVpoWTQMtQKrejR7pQOZR7eJwC42CUzjs/j63JAPssIqx2iL6ZQwvUaUV1Li55fqExzv
	a264OdSYD
X-Received: by 2002:a05:6808:1b22:b0:47c:3640:c597 with SMTP id
 5614622812f47-482b2b7494dmr52544b6e.3.1778609189790; Tue, 12 May 2026
 11:06:29 -0700 (PDT)
MIME-Version: 1.0
From: Jack Sequeira <gabbar.silver@gmail.com>
Date: Tue, 12 May 2026 23:36:18 +0530
X-Gm-Features: AVHnY4LMOn8iFh928FuWoVjIEi57q4WCq-xp4w9mHWR5DSj05XHKRN5ZXzU1ieQ
Message-ID: <CAHN-tEB5MH9iVFxpFyVg1caZUBLekr85NgcBmiqqvYr=wuTzPw@mail.gmail.com>
Subject: MT7921 MediaTek Driver Failure
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000f3a72c0651a2b811"

--000000000000f3a72c0651a2b811
Content-Type: text/plain; charset="UTF-8"

I hope this email finds you well.

My name is Jack Sequeira, and I have been using Linux for quite some time
without major issues related to WiFi drivers. However, I am currently
facing a problem with my system after it resumes from sleep or suspend mode.

After waking the system from suspend, the WiFi driver often fails to work
properly. In some cases, the system experiences a kernel panic, but most of
the time the WiFi stops functioning and I am unable to access the internet.
During this state, the system also does not shut down normally, and I am
forced to power it off using the power button.

System specifications:

   -

   Device: Asus TUF Gaming F17
   -

   Operating Systems: CachyOS (latest version) and Debian 13 with updated
   packages
   -

   GPU: NVIDIA RTX 2050
   -

   CPU: Intel Core i5 11th Gen
   -

   WiFi Chipset/Driver: MediaTek/RealTek MT7921

I would appreciate any guidance or support regarding this issue.

Thank you for your time and assistance.

Kind regards,
Jack Sequeira

--000000000000f3a72c0651a2b811
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>I hope this email finds you well.</p><p>My name is Jack=
 Sequeira, and I have been using Linux for quite some time without major is=
sues related to WiFi drivers. However, I am currently facing a problem with=
 my system after it resumes from sleep or suspend mode.</p><p>After waking =
the system from suspend, the WiFi driver often fails to work properly. In s=
ome cases, the system experiences a kernel panic, but most of the time the =
WiFi stops functioning and I am unable to access the internet. During this =
state, the system also does not shut down normally, and I am forced to powe=
r it off using the power button.</p><p>System specifications:</p><ul><li><p=
>Device: Asus TUF Gaming F17</p></li><li><p>Operating Systems: CachyOS (lat=
est version) and Debian 13 with updated packages</p></li><li><p>GPU: NVIDIA=
 RTX 2050</p></li><li><p>CPU: Intel Core i5 11th Gen</p></li><li><p>WiFi Ch=
ipset/Driver: MediaTek/RealTek MT7921</p></li></ul><p>I would appreciate an=
y guidance or support regarding this issue.</p><p>Thank you for your time a=
nd assistance.</p><p>Kind regards,<br>Jack Sequeira</p></div>

--000000000000f3a72c0651a2b811--
