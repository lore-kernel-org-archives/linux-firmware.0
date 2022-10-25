Return-Path: <SRS0=sUHD=22=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D677AC38A2D
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Oct 2022 20:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD3EFC433D7; Tue, 25 Oct 2022 20:58:24 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74297C433C1
	for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 20:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74297C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id o12so24567717lfq.9
        for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 13:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yUTt6VLq/FG7bgtqV4fhWrAEHOLV/WTIHQhdcrc1Wog=;
        b=Tp0TLa00HLCXtl3ffcadkzejggM1y241hFCoY5J0DWzBHimYZgdV/tt/hkoCAvQB/v
         808aUD+QHNgq3jvfqrzR9B2UqeYUcJxRn8XaUDqQJI2xLfEYy7kRqc0irqxTtTpKrV2C
         pNJkD6raN1oJ5euAK2GgDuoqd3qkKEOUDh/HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUTt6VLq/FG7bgtqV4fhWrAEHOLV/WTIHQhdcrc1Wog=;
        b=XA12w5UmzFsdyk/0X3syL+vq6WxWvihVXDkEVYjAjSPp5JbStfOZAa5xCtoZNKJIij
         dKo8xbEvtNM/aVvjEeiW5aFnm/3B3W1B8wPrPPpYttY3xZlV/arx8sZX5tUNifrv7WH7
         hGk5V28fh/qJqSznNMb9OsEVnVIruKt2k6Os1qYuVlFLw/5m6vJdzQ5CqGfdRh1TH+nn
         QDf05WO3Q6D1BbDr53IzKC7NHJwjD/079dS6Yj1Vc0xNGelhtkoQvLWE85xCGyq0shaf
         jHlBDFPE1ZOs5HhSAH/ux3/biPKTY07Th2tkS1h2rpov669qsQK61jQX55S6SNJ5FyXF
         F/FA==
X-Gm-Message-State: ACrzQf0IZ7oxZdhVn8rvA0Enf/cgPMSFlwUqW0TOHqo4bw5oBLtkMOJl
	UsGr9YqEcfPqpaiSOV30oFEXn6NyNf4H4yHUUFBgQA==
X-Google-Smtp-Source: AMsMyM7k+V4SEh4ZacdYw66y4Hxj0CbKLUR3YfJBFYjUYEQpZYrodngI4GSQU+eNpvTiB8SGEEec/8vIC9OmgIyO1qQ=
X-Received: by 2002:a05:6512:6d4:b0:4a2:f89:db7d with SMTP id
 u20-20020a05651206d400b004a20f89db7dmr14224188lff.125.1666731501476; Tue, 25
 Oct 2022 13:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG7wCv4TwVCtWa2wqHzaG5ncbtfnVJtnQqqDSbEoPmoHw@mail.gmail.com>
 <CAA8EJpoBYb-=3RT_EO+PSFkbJ95RobyeHt6QmOfTTgvEEFoUfQ@mail.gmail.com>
 <CANHAJhEui=wn985RzfsUR+GdsESCExi2Gst43c+WEOBqaD5dTg@mail.gmail.com> <CAF6AEGs3RoB7zm8NjgsHMfqGY=-+etr8-EEuZw1MPUaXbDBy_A@mail.gmail.com>
In-Reply-To: <CAF6AEGs3RoB7zm8NjgsHMfqGY=-+etr8-EEuZw1MPUaXbDBy_A@mail.gmail.com>
From: Nathan Hebert <nhebert@chromium.org>
Date: Tue, 25 Oct 2022 13:58:10 -0700
Message-ID: <CANHAJhEWXf8U-FJJbOUpRV1gCXsd++H8kzbiBP1Z7iryaOCoYQ@mail.gmail.com>
Subject: Re: [PULL V2]: qcom: SC7180 and SC7280 venus firmware updates
To: Rob Clark <robdclark@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-firmware@kernel.org, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 25, 2022 at 7:24 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Oct 24, 2022 at 4:13 PM Nathan Hebert <nhebert@chromium.org> wrote:
> >
> > On Thu, Oct 20, 2022 at 11:02 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, 20 Oct 2022 at 20:08, Nathan Hebert <nhebert@chromium.org> wrote:
> > > >
> > > > The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> > > >
> > > >   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://github.com/nathan-google/linux-firmware.git
> > > > update_sc7180_and_sc7280_firmwares_v2
> > > >
> > > > for you to fetch changes up to 054271e4164b6b4c069a3aaaeb9bfcde8c850339:
> > > >
> > > >   qcom: update venus firmware files for VPU-2.0 (2022-10-20 09:37:35 -0700)
> > > >
> > > > ----------------------------------------------------------------
> > > > Nathan Hebert (3):
> > > >       qcom: update venus firmware files for v5.4
> > > >       qcom: remove split SC7280 venus firmware images
> > > >       qcom: update venus firmware files for VPU-2.0
> > > >
> > > >  WHENCE                   |  17 ++---------------
> > > >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> > > >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> > > >  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
> > > >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
> > > >  qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
> > > >  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> > > >  qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
> > > >  qcom/vpu-2.0/venus.b19   |   1 -
> > > >  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
> > > >  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
> > > >  21 files changed, 2 insertions(+), 16 deletions(-)
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b00
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b01
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b02
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b03
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b04
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b05
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b06
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b07
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b08
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b09
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b10
> > > >  delete mode 100644 qcom/vpu-2.0/venus.b19
> > > >  delete mode 100644 qcom/vpu-2.0/venus.mdt
> > >
> > > As I wrote in another email thread, it might be better to drop split
> > > files, add only venus.mbn and then use Link: lines to create venus.mdt
> > > -> venus.mbn symlinks.
> > Thanks for the feedback. There was some concern from Vikash at Qualcomm
> > about making a change to the venus-5.4 firmware to drop the split files.
> >
> > Vikash, are you able to comment about whether or not it is a concern to replace
> > the venus.mdt and split files with a symbolic link to venus.mdn for
> > the venus-5.4
> > files? I tested the suggested approach on ChromeOS with kernels based on 5.4
> > and 5.15 and did not see any issues.
> >
> > This is a holiday week, so his response may be slow.
> >
>
> The symlink trick that Dmitry suggested would cover the case that
> Vikash is concerned about.
>
> BR,
> -R
Thanks Rob, Dmitry, and Vikash for the feedback. I have sent a V3 pull
request that incorporates Dmitry's suggestion to the linux-firmware
mailing list.

BR,
Nathan
