Return-Path: <SRS0=KLj5=22=gmail.com=robdclark@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6416C38A2D
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Oct 2022 14:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2B86C433C1; Tue, 25 Oct 2022 14:25:00 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CDD8C433D6;
	Tue, 25 Oct 2022 14:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CDD8C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id m5-20020a9d73c5000000b0066738ce4f12so642710otk.12;
        Tue, 25 Oct 2022 07:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bGXBYeUCndwf1ekXAko01QJwh6PKL7XDvbvRJfB1gLg=;
        b=ABkhzuabWPvcbK7CBOkSdN8eZIXM3y1u1pX7369I6XJUtKC4hhD8XCNWwsCDdpeQK/
         eARAMDiDT9BXj8FQXYKNOzaIIc9ISnEFva/+VZZ7ik3Wp6gJqzbNbRL5KyXLaeXPxgS8
         ro/onwUqkiNYoRhRcJxm/PAneU+cFjzYHGJWI7hZCcNNHBYLB9M2x/eJYwLP6M3ry/nz
         K3FCz3+2RgO3drUIumxkUkiL+ECbTZZj7La0WJKziRi3tmSxJsMrLqyaHpi9EGC7cSCR
         8kH0BSIOkSKL7gdcqnbL/xCBwxlR9Wh+0qFbg5JKZSEWLJlOuFG/EYqaLNJzdYHrK1jS
         9Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGXBYeUCndwf1ekXAko01QJwh6PKL7XDvbvRJfB1gLg=;
        b=0CpgkbJcEeoyBKIszbZXBisFIsKf/2n7qmO1zohTDQkLcazz4ErwoIQyHWkH2zBG7E
         NlkSYO+Skf87yQiSc+2fhLJ6LCvIMwwCy13f22sXD96UrFIXPKDYFp6xGstGmPzbCuvM
         R9D2at7ApKwx6Kx2LJtatg/vup5iF0aTAs3sC+EhzEgOM7tbMOpq0tIgYIUxV5sLW2BT
         XPf9zdFNK1BINQyA97yJi2L22UnVvOnA2DOtX0KUI8eoyOPH7Po2zdtJo7v31KbeHSOo
         AQY/u0MwaOo7zw0qlVHiXkYnTUh/y5Jl8vv3bmVLlfDlYaMzDJR/8OIlyLSQStKxOw9K
         wK8w==
X-Gm-Message-State: ACrzQf0Fm48tDmmVTSsKaZ9S3XJGJEQj8lPWVPvgKHJ5ybWSXCAX1Ufv
	NwXd2L9uPyBw/FEMQwZAK+due2+iYjMgK5VjBhI=
X-Google-Smtp-Source: AMsMyM5bklZuoqpKZZRuGDvHRGRqS0T5rB4ABN1ptMUYJcLWaRA63AJDnnJrvsw6mmTXt56tqu5QGbTMo5XOWSul4IM=
X-Received: by 2002:a05:6830:2644:b0:661:e80b:bd4b with SMTP id
 f4-20020a056830264400b00661e80bbd4bmr19252184otu.22.1666707898262; Tue, 25
 Oct 2022 07:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG7wCv4TwVCtWa2wqHzaG5ncbtfnVJtnQqqDSbEoPmoHw@mail.gmail.com>
 <CAA8EJpoBYb-=3RT_EO+PSFkbJ95RobyeHt6QmOfTTgvEEFoUfQ@mail.gmail.com> <CANHAJhEui=wn985RzfsUR+GdsESCExi2Gst43c+WEOBqaD5dTg@mail.gmail.com>
In-Reply-To: <CANHAJhEui=wn985RzfsUR+GdsESCExi2Gst43c+WEOBqaD5dTg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Oct 2022 07:24:46 -0700
Message-ID: <CAF6AEGs3RoB7zm8NjgsHMfqGY=-+etr8-EEuZw1MPUaXbDBy_A@mail.gmail.com>
Subject: Re: [PULL V2]: qcom: SC7180 and SC7280 venus firmware updates
To: Nathan Hebert <nhebert@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-firmware@kernel.org, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 24, 2022 at 4:13 PM Nathan Hebert <nhebert@chromium.org> wrote:
>
> On Thu, Oct 20, 2022 at 11:02 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 20 Oct 2022 at 20:08, Nathan Hebert <nhebert@chromium.org> wrote:
> > >
> > > The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> > >
> > >   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/nathan-google/linux-firmware.git
> > > update_sc7180_and_sc7280_firmwares_v2
> > >
> > > for you to fetch changes up to 054271e4164b6b4c069a3aaaeb9bfcde8c850339:
> > >
> > >   qcom: update venus firmware files for VPU-2.0 (2022-10-20 09:37:35 -0700)
> > >
> > > ----------------------------------------------------------------
> > > Nathan Hebert (3):
> > >       qcom: update venus firmware files for v5.4
> > >       qcom: remove split SC7280 venus firmware images
> > >       qcom: update venus firmware files for VPU-2.0
> > >
> > >  WHENCE                   |  17 ++---------------
> > >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> > >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> > >  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
> > >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
> > >  qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
> > >  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> > >  qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
> > >  qcom/vpu-2.0/venus.b19   |   1 -
> > >  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
> > >  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
> > >  21 files changed, 2 insertions(+), 16 deletions(-)
> > >  delete mode 100644 qcom/vpu-2.0/venus.b00
> > >  delete mode 100644 qcom/vpu-2.0/venus.b01
> > >  delete mode 100644 qcom/vpu-2.0/venus.b02
> > >  delete mode 100644 qcom/vpu-2.0/venus.b03
> > >  delete mode 100644 qcom/vpu-2.0/venus.b04
> > >  delete mode 100644 qcom/vpu-2.0/venus.b05
> > >  delete mode 100644 qcom/vpu-2.0/venus.b06
> > >  delete mode 100644 qcom/vpu-2.0/venus.b07
> > >  delete mode 100644 qcom/vpu-2.0/venus.b08
> > >  delete mode 100644 qcom/vpu-2.0/venus.b09
> > >  delete mode 100644 qcom/vpu-2.0/venus.b10
> > >  delete mode 100644 qcom/vpu-2.0/venus.b19
> > >  delete mode 100644 qcom/vpu-2.0/venus.mdt
> >
> > As I wrote in another email thread, it might be better to drop split
> > files, add only venus.mbn and then use Link: lines to create venus.mdt
> > -> venus.mbn symlinks.
> Thanks for the feedback. There was some concern from Vikash at Qualcomm
> about making a change to the venus-5.4 firmware to drop the split files.
>
> Vikash, are you able to comment about whether or not it is a concern to replace
> the venus.mdt and split files with a symbolic link to venus.mdn for
> the venus-5.4
> files? I tested the suggested approach on ChromeOS with kernels based on 5.4
> and 5.15 and did not see any issues.
>
> This is a holiday week, so his response may be slow.
>

The symlink trick that Dmitry suggested would cover the case that
Vikash is concerned about.

BR,
-R
