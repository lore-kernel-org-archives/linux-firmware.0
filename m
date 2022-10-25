Return-Path: <SRS0=sUHD=22=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC77C04A95
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Oct 2022 15:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C465EC433B5; Tue, 25 Oct 2022 15:13:51 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68475C433D7
	for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 15:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 68475C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id o12so22590012lfq.9
        for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 08:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mPdvsYX06rc3Ks/14FGdPaOc6oYfWhC+pbCymphc/4c=;
        b=Z6hpRPd+ofAVsWbCHiNzB2FCVrfltXUwBHR1jZ9v2LCIuY5anRar+hUxLgxH8bKIvi
         nTpaz6taj11oo7uqq5E6WyKrwtQtNYIxb4cG1GJ7KI5BkaAjFSV+tpkn8zMuiw7zN+ii
         FewxLez0ati7+ufi35rWbchuumT5Zyv1KLEec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPdvsYX06rc3Ks/14FGdPaOc6oYfWhC+pbCymphc/4c=;
        b=TuU+vADhpcq0Rj4rZYx7QzkSrI2pqEGkpOqiF0Ipe5BhgOJRD/lUbY66THmIZbOMbf
         AYxlIEVrLhLyz9bqNFHa0VbhTRLJcBcEys91krzlv/TlK89pgiHh4s+B6xL76mUYAera
         VnW6AtytI/UmluD83MP27Dkb2tdi248gQLYGifQYGiLYcHwauuY9nEoZKYfMqB6o4SYn
         UMBmerWkZvy8stQXbKsD4w1Matkd+Ca9270FsXtMGxoAFMx6iaqe7+v2tcxw2IqSs6Ni
         ZnNQ+Pn91CSHazceS+J4zhIicxbA6H7Rywild/KTDYrXjpUo4NeRU0Xk2e/ltUuJPWbQ
         WRcw==
X-Gm-Message-State: ACrzQf0CHu+ZohQGMvWXqnnJg6H6YuBEZCX41RWkFjiC+vKJz1OS5vzM
	j+7b1jgeUCO5WhmnDia6mxybhn2BNfeM+R7LjrRxqw==
X-Google-Smtp-Source: AMsMyM504ELQJTw1poH/bkNrCCC7+x2XnF/JoEga1UIU8SOjes9OxdupjSJOJHZF6uaoaYawS2vlBmRSJKj/YpO2Q0U=
X-Received: by 2002:a05:6512:104e:b0:4a2:6bd2:4db5 with SMTP id
 c14-20020a056512104e00b004a26bd24db5mr14745643lfb.52.1666710828422; Tue, 25
 Oct 2022 08:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
 <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
 <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com>
 <DM8PR02MB8169E5D5C972BE45207F70C2F32B9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <CANHAJhG2PM-KS9GVHOE0xh+5KpKy5qjFBqteRGqNONiasjprBg@mail.gmail.com>
 <CAA8EJprUPw8NChfOferwXEmahkhOHrQvRxpVOhpNJUoZgexHkQ@mail.gmail.com> <DM8PR02MB8169A81C4117598D4053084EF3319@DM8PR02MB8169.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8169A81C4117598D4053084EF3319@DM8PR02MB8169.namprd02.prod.outlook.com>
From: Nathan Hebert <nhebert@chromium.org>
Date: Tue, 25 Oct 2022 08:13:37 -0700
Message-ID: <CANHAJhF_TjOGbKqkOHDaZ+7nGRax4MAcF35iYe51tLEfhi_LZg@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To: Vikash Garodia <vgarodia@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, Fritz Koenig <frkoenig@chromium.org>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Vikash,

On Mon, Oct 24, 2022 at 11:20 PM Vikash Garodia
<vgarodia@qti.qualcomm.com> wrote:
>
> Hi Dmitry,
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Thursday, October 20, 2022 11:31 PM
> > To: Nathan Hebert <nhebert@chromium.org>
> > Cc: Vikash Garodia <vgarodia@qti.qualcomm.com>; Rob Clark
> > <robdclark@gmail.com>; linux-firmware@kernel.org; linux-arm-
> > msm@vger.kernel.org; Vikash Garodia (QUIC) <quic_vgarodia@quicinc.com>;
> > Fritz Koenig <frkoenig@chromium.org>; Bjorn Andersson
> > <andersson@kernel.org>
> > Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary of
> > any links or attachments, and do not enable macros.
> >
> > Hi,
> >
> > On Thu, 20 Oct 2022 at 19:52, Nathan Hebert <nhebert@chromium.org>
> > wrote:
> > >
> > > On Wed, Oct 19, 2022 at 10:09 AM Vikash Garodia
> > > <vgarodia@qti.qualcomm.com> wrote:
> > > >
> > > > Hi Rob,
> > > >
> > > > > -----Original Message-----
> > > > > From: Rob Clark <robdclark@gmail.com>
> > > > > Sent: Wednesday, October 19, 2022 9:32 PM
> > > > > To: Nathan Hebert <nhebert@chromium.org>
> > > > > Cc: linux-firmware@kernel.org; linux-arm-msm@vger.kernel.org;
> > > > > Vikash Garodia (QUIC) <quic_vgarodia@quicinc.com>; Fritz Koenig
> > > > > <frkoenig@chromium.org>; Bjorn Andersson <andersson@kernel.org>
> > > > > Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware
> > > > > updates
> > > > >
> > > > > WARNING: This email originated from outside of Qualcomm. Please be
> > > > > wary of any links or attachments, and do not enable macros.
> > > > >
> > > > > Actually, isn't the .mbn the joined fw?  If so all you need to do
> > > > > is remove the other files?
> > > > .mbn is the complete firmware image. We have migrated to .mbn for
> > > > sc7280, while the Initial days of sc7280 was with .mdt binaries
> > > > (split ones). So to support the boards which Have not upgraded the driver,
> > we are retaining all binaries.
> > > >
> > >
> > > Thanks for the feedback (on and off-list). I will push a V2 of the
> > > pull request with the following changes:
> > >
> > > 1. Update both split and non-split binaries for venus-5.4 (SC7180).
> > > Also, update the version in WHENCE. We can remove the legacy split
> > > images in a later commit if it is feasible to do so.
> >
> > The mdt loader doesn't care about the file extension, the mdt loader will
> > determine the type of the file based on the file contents. Thus I'd suggest adding
> > only mbn files and adding a compat symlinks pointing from venus.mdt to
> > venus.mbn
>
> sc7180 is using venus-5.4 firmware and currently the name is passed as "qcom/venus-5.4/venus.mdt" while making call to "request_firmware()"
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/qcom/venus/core.c#L765
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/qcom/venus/firmware.c#L104
Thanks for the code links! That is helpful.
>
> IIUC, before we remove the split files (.mdt), we should also make change in driver to update the name from .mdt to .mbn.
> Please help to clarify if we can remove the split files with driver still referring to "qcom/venus-5.4/venus.mdt" in call to request_firmware().
I think Dmitry is saying that we could remove the venus.b0* files and
replace the venus.mdt
file with a symbolic link to venus.mbn. This would achieve the goal of
reducing the size of the
files that are stored and deployed, while staying compatible with the
existing driver code.

The best solution would probably be to change the driver to load the
.mbn files, but using the
symbolic link seems like a good intermediate solution. If there is no
complaint about Dmitiry's
suggestion, I will make a PR V3 with an additional commit to remove
the split files and use a
symbolic link linking venus.mdt to venus.mbn. This commit will precede
the commit to update
venus 5.4 firmware.
>
> > > 2. Remove the split firmware images for vpu-2.0 (SC7280). There is no
> > > released device that uses the older firmware loader. I have tested to
> > > make sure the non-split image can be loaded and that the venus media
> > > functions work on a
> > > SC7280 device using a ChromeOS kernel based on 5.15.
> > > 3. Update the VPU-2.0 non-split binaries to the latest version and
> > > update the version in the WHENCE file.
> >
> >
> > --
> > With best wishes
> > Dmitry
