Return-Path: <SRS0=S1C3=WQ=gmail.com=olsenjoe74@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC62C433EF
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Jun 2022 04:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F4052C34115; Thu,  9 Jun 2022 04:16:50 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 616A1C34114
	for <linux-firmware@kernel.org>; Thu,  9 Jun 2022 04:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 616A1C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id q1so24810887ljb.5
        for <linux-firmware@kernel.org>; Wed, 08 Jun 2022 21:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=I8zRyy/V+vPQfj9iD7UXz2J2ftYxiYuAkm3r4WaDSdg=;
        b=ee1mxXB1ELy9alLHmkSiXkHwA5dlX00zZ4CWmY1YQPl5iTmo14ax9yvnr7BINjb6ls
         JbkVQPl54rlOnDZnuPFzOpAhNaPIfpz93z/UQIHzBD3xrbTeDBxE10uBMNFfFvOPTRXs
         dbZKGt+l9ud6CR1FY7C4PTgQXKYj8jaSBzIpDvWTgpgbo/muCpT66e86IphhZRBLV7L9
         LpR/vWOx+LXeIdKnP4zLv+uxoa6SqtTSUB4MB401+XxyuhMhkVMH/KpP23FEXlBORUBq
         teRX7IgnJvugXuW+BZw6xxnCKbohGhknhs0+diCCLtN9yLY0WJlkW4o0ShDgFvaOOYcb
         de+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=I8zRyy/V+vPQfj9iD7UXz2J2ftYxiYuAkm3r4WaDSdg=;
        b=2Raok2bbuq9kG/YJqcMXnPHe8QEbwkR0lsQeABfh165667QIZGkQPu4Nwpd1cn52uT
         3htjHYEc8uONLE8smr/IjGKRLmccQu69FZnfkakBS/zKmQE1LG2MUeIFgV/0yNIm1hga
         i6N/9ztpwMJyGoafTklSQ4cmefOC+WRQ41TtiafRLjSoBcbn+TS0T86YhYHIJN/f4RrS
         o5zmvRRARA7J9pQSGC9MzbAUhyXB6jzeBrcRvpK/226h/7yAcwf4ckGSfDjEEtoEsnnU
         1AKAJIVuxoRNG2C6+emqzs7p1nEBytXMKRKcYCfXBtWXx+LiVkE74p+E1wAn6w4e36X/
         35aQ==
X-Gm-Message-State: AOAM533NJQii01tgpNzdhgMV6YLU4MHI9Qi5565dB3FlIxuIRumKe1eu
	+69J31TKkJ6VE1B9TDoCGGO1uMqy3cKZspncR/ZGHtbI2zDu+g==
X-Google-Smtp-Source: ABdhPJw4QOfpsamJBV58Zoud8T61WKXb1Rki70/TpXDnBxsBpyYG6aaS9mDjIgtxLAwrxHuX5mg3mfRp8qyCtJeCL0Y=
X-Received: by 2002:a2e:818c:0:b0:255:a6c5:4304 with SMTP id
 e12-20020a2e818c000000b00255a6c54304mr7284785ljg.367.1654748208133; Wed, 08
 Jun 2022 21:16:48 -0700 (PDT)
MIME-Version: 1.0
From: Hightower <olsenjoe74@gmail.com>
Date: Wed, 8 Jun 2022 21:16:36 -0700
Message-ID: <CAJSChjb4r=rROqhNmwwCbXNmwHC2w6AskYSyOxbhihYRTmScNg@mail.gmail.com>
Subject: Hi I need missing firmware for t490s
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000237c2b05e0fc1791"

--000000000000237c2b05e0fc1791
Content-Type: text/plain; charset="UTF-8"

Thanks

--000000000000237c2b05e0fc1791
Content-Type: text/html; charset="UTF-8"

<div dir="auto">Thanks<div dir="auto"><br></div></div>

--000000000000237c2b05e0fc1791--
