Return-Path: <SRS0=6kr5=2Z=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9832BC38A2D
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Oct 2022 23:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69FCDC433D6; Mon, 24 Oct 2022 23:13:28 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31F3BC433B5
	for <linux-firmware@kernel.org>; Mon, 24 Oct 2022 23:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31F3BC433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id r12so2877010lfp.1
        for <linux-firmware@kernel.org>; Mon, 24 Oct 2022 16:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N++ECBeiYTMrGhdzzlYvKWtcZRGylld/eBk1VfSFo+0=;
        b=Jb3dJUcj77xb+NVMl3d7F4DKDlJf9tqwDpl7Xk1CzibXBGhUajRZ+DnWG+TJlG/TnW
         DkMeADFDKCGWeMHhH4H8KSku8hvHXNMJ0HlnDBe6GX/lhngtZqXN1wUC+fW42a1nJxeE
         efabcSBwNuQI7669JcRJzn0CmSoqz1pK59H7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N++ECBeiYTMrGhdzzlYvKWtcZRGylld/eBk1VfSFo+0=;
        b=5pRflbySBmdrcjbNgFdf6XV+UMNrquce0eU478ZwXajTE1RYDk/6slGJSTUpJR+YD7
         D/iTp3NxvPfYvNbj5DL0Ij6I5GEO6rh3olNkZOpRbUP3M//XmCHlU5GOaSfsBi/K7NSg
         7yagXhX6zLWCMgwXGdxBX8KL3o/6UivmB5WixBp1nq2dC9Kw+LvKe1yGzytMq3DU6zZ9
         OarPuYaq3oUfinFLpC/P29OhuJEOnJ4or+KC4ncmWEJvii4n1OP/UrAdHORxrO+LD4Pn
         vp5WkKb/Xx2ewNSekhGPfD/C0M46bZTA0qsjMloRTmTqbEe5MYo0MdiC8dY50O8g4hR/
         P4ww==
X-Gm-Message-State: ACrzQf393oPSTUI5S1oAqIcw6YnYowaUwRBkW7M3z4lI7Z0F9ria9Wkl
	/J+Y6tTMMLu1XUuZsnIwAhvJbAF16ylIN4LKZc0bDw==
X-Google-Smtp-Source: AMsMyM4zgnkTMjwuPQychO5/KeczfWRL6z5D7QwOTlvV0HoDnDHmmJJoSpbO/Td0JYGontrEUP3ONUHVi4cb5C+4yLM=
X-Received: by 2002:a05:6512:104e:b0:4a2:6bd2:4db5 with SMTP id
 c14-20020a056512104e00b004a26bd24db5mr13284277lfb.52.1666653205078; Mon, 24
 Oct 2022 16:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG7wCv4TwVCtWa2wqHzaG5ncbtfnVJtnQqqDSbEoPmoHw@mail.gmail.com>
 <CAA8EJpoBYb-=3RT_EO+PSFkbJ95RobyeHt6QmOfTTgvEEFoUfQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoBYb-=3RT_EO+PSFkbJ95RobyeHt6QmOfTTgvEEFoUfQ@mail.gmail.com>
From: Nathan Hebert <nhebert@chromium.org>
Date: Mon, 24 Oct 2022 16:13:12 -0700
Message-ID: <CANHAJhEui=wn985RzfsUR+GdsESCExi2Gst43c+WEOBqaD5dTg@mail.gmail.com>
Subject: Re: [PULL V2]: qcom: SC7180 and SC7280 venus firmware updates
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Rob Clark <robdclark@gmail.com>, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 20, 2022 at 11:02 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 20 Oct 2022 at 20:08, Nathan Hebert <nhebert@chromium.org> wrote:
> >
> > The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> >
> >   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/nathan-google/linux-firmware.git
> > update_sc7180_and_sc7280_firmwares_v2
> >
> > for you to fetch changes up to 054271e4164b6b4c069a3aaaeb9bfcde8c850339:
> >
> >   qcom: update venus firmware files for VPU-2.0 (2022-10-20 09:37:35 -0700)
> >
> > ----------------------------------------------------------------
> > Nathan Hebert (3):
> >       qcom: update venus firmware files for v5.4
> >       qcom: remove split SC7280 venus firmware images
> >       qcom: update venus firmware files for VPU-2.0
> >
> >  WHENCE                   |  17 ++---------------
> >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> >  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
> >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
> >  qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
> >  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> >  qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
> >  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
> >  qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
> >  qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
> >  qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
> >  qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
> >  qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
> >  qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
> >  qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
> >  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
> >  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
> >  qcom/vpu-2.0/venus.b19   |   1 -
> >  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
> >  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
> >  21 files changed, 2 insertions(+), 16 deletions(-)
> >  delete mode 100644 qcom/vpu-2.0/venus.b00
> >  delete mode 100644 qcom/vpu-2.0/venus.b01
> >  delete mode 100644 qcom/vpu-2.0/venus.b02
> >  delete mode 100644 qcom/vpu-2.0/venus.b03
> >  delete mode 100644 qcom/vpu-2.0/venus.b04
> >  delete mode 100644 qcom/vpu-2.0/venus.b05
> >  delete mode 100644 qcom/vpu-2.0/venus.b06
> >  delete mode 100644 qcom/vpu-2.0/venus.b07
> >  delete mode 100644 qcom/vpu-2.0/venus.b08
> >  delete mode 100644 qcom/vpu-2.0/venus.b09
> >  delete mode 100644 qcom/vpu-2.0/venus.b10
> >  delete mode 100644 qcom/vpu-2.0/venus.b19
> >  delete mode 100644 qcom/vpu-2.0/venus.mdt
>
> As I wrote in another email thread, it might be better to drop split
> files, add only venus.mbn and then use Link: lines to create venus.mdt
> -> venus.mbn symlinks.
Thanks for the feedback. There was some concern from Vikash at Qualcomm
about making a change to the venus-5.4 firmware to drop the split files.

Vikash, are you able to comment about whether or not it is a concern to replace
the venus.mdt and split files with a symbolic link to venus.mdn for
the venus-5.4
files? I tested the suggested approach on ChromeOS with kernels based on 5.4
and 5.15 and did not see any issues.

This is a holiday week, so his response may be slow.

>
> --
> With best wishes
> Dmitry
