Return-Path: <SRS0=guQf=2V=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEA0C433FE
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Oct 2022 16:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 034A4C433B5; Thu, 20 Oct 2022 16:52:21 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7FB1C433C1
	for <linux-firmware@kernel.org>; Thu, 20 Oct 2022 16:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7FB1C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id bp15so314269lfb.13
        for <linux-firmware@kernel.org>; Thu, 20 Oct 2022 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s/ZEXKDRDRj3WNNr3hTK31vGtN01dCNnxQgVkyZFvXk=;
        b=MCAncbePD1KRjyATSdVpV/pz75l4UrRbEkvXPGcnW7sCexuHzPieoFtTxDHdZ6K7k0
         A/KG1RH9os9yi5+X140BnoSuSIhIUzmHym/5Iw5Fnc6Z5twF/c3IUIpmBUdukBPwVPlf
         9NKplRt0s6EFHLSYLfjDx3t4Sb/Ak0PgN2f9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/ZEXKDRDRj3WNNr3hTK31vGtN01dCNnxQgVkyZFvXk=;
        b=JKYH1yKYxSGiuzPqmmVqgXdV5JykfeyvUeEV7wxqVUxD0mQgllCLLJ9jOF3WMmZ7zw
         6A1K6gGuHd14oo869MKdB0BbyAmau/W0kKvvJ5lOzRVkvKXqbURvy7uoT/YQQNUufa5X
         M1tlqyn9M3Qx0PmslxyPi0s0a/jUxz15s7yzchS2i50Kbw47OWThxAIuzwWzUTdF8D12
         fD7HQRVaiw/LlZzmQNWPg1T5yJ+OkdRBiXtwrAcRbe8jmPaiQXr/KeHhEcGSAyRviK3Q
         FD4bilsbw01aiosLY64/QzQth8BAc9dmyi1yePF6b+o7rX6oAknpFztgj4VFbray3ZMb
         zanw==
X-Gm-Message-State: ACrzQf1CN1iaT4SyT5paBYyV8RBXU3a+pu+WRAJPkmgBLjrTp+O6siyd
	bCj4o+MgzdZdG3eJyY5kg9qG5oH33c0YZ1FOvXe8gw==
X-Google-Smtp-Source: AMsMyM6foqy60+V71r5PMJ0enkd1Nd/f7VvEQyYXSD/OhVePzreiswI+fR0A/ZowIhO2a4vFIoPAUwjMakApyrsmXCA=
X-Received: by 2002:a05:6512:6d4:b0:4a2:f89:db7d with SMTP id
 u20-20020a05651206d400b004a20f89db7dmr5048536lff.125.1666284737895; Thu, 20
 Oct 2022 09:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
 <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
 <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com> <DM8PR02MB8169E5D5C972BE45207F70C2F32B9@DM8PR02MB8169.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8169E5D5C972BE45207F70C2F32B9@DM8PR02MB8169.namprd02.prod.outlook.com>
From: Nathan Hebert <nhebert@chromium.org>
Date: Thu, 20 Oct 2022 09:52:06 -0700
Message-ID: <CANHAJhG2PM-KS9GVHOE0xh+5KpKy5qjFBqteRGqNONiasjprBg@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To: Vikash Garodia <vgarodia@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, Fritz Koenig <frkoenig@chromium.org>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 10:09 AM Vikash Garodia
<vgarodia@qti.qualcomm.com> wrote:
>
> Hi Rob,
>
> > -----Original Message-----
> > From: Rob Clark <robdclark@gmail.com>
> > Sent: Wednesday, October 19, 2022 9:32 PM
> > To: Nathan Hebert <nhebert@chromium.org>
> > Cc: linux-firmware@kernel.org; linux-arm-msm@vger.kernel.org; Vikash
> > Garodia (QUIC) <quic_vgarodia@quicinc.com>; Fritz Koenig
> > <frkoenig@chromium.org>; Bjorn Andersson <andersson@kernel.org>
> > Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary of
> > any links or attachments, and do not enable macros.
> >
> > Actually, isn't the .mbn the joined fw?  If so all you need to do is remove the
> > other files?
> .mbn is the complete firmware image. We have migrated to .mbn for sc7280, while the
> Initial days of sc7280 was with .mdt binaries (split ones). So to support the boards which
> Have not upgraded the driver, we are retaining all binaries.
>

Thanks for the feedback (on and off-list). I will push a V2 of the pull request
with the following changes:

1. Update both split and non-split binaries for venus-5.4 (SC7180). Also,
update the version in WHENCE. We can remove the legacy split images in a later
commit if it is feasible to do so.
2. Remove the split firmware images for vpu-2.0 (SC7280). There is no released
device that uses the older firmware loader. I have tested to make sure the
non-split image can be loaded and that the venus media functions work on a
SC7280 device using a ChromeOS kernel based on 5.15.
3. Update the VPU-2.0 non-split binaries to the latest version and update the
version in the WHENCE file.

> > On Wed, Oct 19, 2022 at 8:52 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > Hmm, does venus not support the combined firmware yet?  Elsewhere
> > > we've moved away from split fw to using a single ELF file..
> > >
> > > BR,
> > > -R
> > >
> > > On Tue, Oct 18, 2022 at 2:18 PM Nathan Hebert <nhebert@chromium.org>
> > wrote:
> > > >
> > > > The following changes since commit
> > 48407ffd7adb9511701547068b1e6f0956bd1c94:
> > > >
> > > >   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43
> > > > -0400)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://github.com/nathan-google/linux-firmware.git
> > > > update_sc7180_and_sc7280_firmwares
> > > >
> > > > for you to fetch changes up to
> > 76e160366a28010fa06ddc965659c38a44d159d9:
> > > >
> > > >   qcom: update venus firmware files for VPU-2.0 (2022-10-18 13:42:58
> > > > -0700)
> > > >
> > > > ----------------------------------------------------------------
> > > > Nathan Hebert (2):
> > > >       qcom: update venus firmware files for v5.4
> > > >       qcom: update venus firmware files for VPU-2.0
> > > >
> > > >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> > > >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> > > >  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
> > > >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
> > > > qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
> > > > qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> > > >  qcom/vpu-2.0/venus.b00   | Bin 692 -> 692 bytes
> > > >  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 7376 bytes
> > > >  qcom/vpu-2.0/venus.b02   | Bin 300 -> 300 bytes
> > > >  qcom/vpu-2.0/venus.b04   | Bin 20 -> 20 bytes
> > > >  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 939472 bytes
> > > >  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 43120 bytes
> > > >  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
> > > >  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 8068 bytes
> > > >  14 files changed, 0 insertions(+), 0 deletions(-)
>
> Thanks,
> Vikash
