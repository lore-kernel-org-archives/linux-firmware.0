Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B135ECAAA1
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Sep 2022 12:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DB1CC4347C; Mon, 12 Sep 2022 12:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16739C433B5;
	Mon, 12 Sep 2022 12:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662985126;
	bh=PlM8aCqvCpz12+m64lxuZ5CI12Vj5OcF6vL7UPEIATE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VabClxTDw9orqcY62zAt/NCPI+pEuzWvKXEyuQXes6K37tS9ChRowrcUpmpsjpTFe
	 gpDIgM0uM+07tZBTb7Q5/LuwT7vezimOP408sj54FEWejghDUX4e8JL17KrHF4YnEG
	 v7ewMLgf7hy+J65M8dTQiKswhLHGIdqQoUnoXcw0U9FFB1RLojeZIFvx+4J0MY2NoZ
	 0uQCQx2GYkdzH0Uoo1mkYBfudqeF2qOm8QTPpNh6eKwxHhXfs8d6Q93R0/juOLiyB6
	 uNG5kg/LueJcpW9AY+hf91IpfWny6F/T9wQTy5G6gQcJqi01VMS5a9AvWz+TL2hQXx
	 UmwuNCjv4e50A==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1278a61bd57so22792946fac.7;
        Mon, 12 Sep 2022 05:18:46 -0700 (PDT)
X-Gm-Message-State: ACgBeo2skH8+QZcs+rWex/TA5R+M+5d2TffT7U5XcgDr3rZtayp6quqE
	l+lxABax5WqkWYo3NxsrCmxn2HrzRGQj4PMuv2Y=
X-Google-Smtp-Source: AA6agR5Fl5kI0GahSp3BpD4VVGh8AzD9lBAGWVn0thTzz7yxPba81mvK3Dt+4iJpb0ajmRdkegnsOliUG/o6L6lGKyI=
X-Received: by 2002:aca:5bc3:0:b0:345:30a2:89da with SMTP id
 p186-20020aca5bc3000000b0034530a289damr8748660oib.3.1662985125138; Mon, 12
 Sep 2022 05:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220908143742.3362357-1-dmitry.baryshkov@linaro.org> <20220908231435.bnqeajjyrq3twvm6@builder.lan>
In-Reply-To: <20220908231435.bnqeajjyrq3twvm6@builder.lan>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 12 Sep 2022 08:18:34 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5pmZMxePvnBeU4K=f2gPoiDPqpc+d2CO+G-C+xjfrUrw@mail.gmail.com>
Message-ID: <CA+5PVA5pmZMxePvnBeU4K=f2gPoiDPqpc+d2CO+G-C+xjfrUrw@mail.gmail.com>
Subject: Re: [PATCH] qcom: rename Lenovo ThinkPad X13s firmware paths
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-firmware@kernel.org, 
	Mark Pearson <markpearson@lenovo.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 7:14 PM Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Thu, Sep 08, 2022 at 05:37:42PM +0300, Dmitry Baryshkov wrote:
> > After some discussion with Bjorn, the Qualcomm platform maintainer, it
> > was agreed to follow the established practice and to inject the SoC name
> > into the firmware paths.
> >
> > It is highly unlikely that we are going to run Linux off the existing
> > ACPI data in these platforms anytime soon. And even if we do so, we'd
> > have to figure out the file names anyway, as they do not follow the
> > existing standard names.
> >
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Cc: Mark Pearson <markpearson@lenovo.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Acked-by: Bjorn Andersson <andersson@kernel.org>

Applied and pushed out.

josh

>
> Regards,
> Bjorn
>
> > ---
> >  WHENCE                                         |  17 +++++++++--------
> >  qcom/{ => sc8280xp}/LENOVO/21BX/adspr.jsn      |   0
> >  qcom/{ => sc8280xp}/LENOVO/21BX/adspua.jsn     |   0
> >  qcom/{ => sc8280xp}/LENOVO/21BX/battmgr.jsn    |   0
> >  qcom/{ => sc8280xp}/LENOVO/21BX/cdspr.jsn      |   0
> >  qcom/{ => sc8280xp}/LENOVO/21BX/qcadsp8280.mbn | Bin
> >  qcom/{ => sc8280xp}/LENOVO/21BX/qccdsp8280.mbn | Bin
> >  .../LENOVO/21BX/qcdxkmsuc8280.mbn              | Bin
> >  qcom/{ => sc8280xp}/LENOVO/21BX/qcslpi8280.mbn | Bin
> >  9 files changed, 9 insertions(+), 8 deletions(-)
> >  rename qcom/{ => sc8280xp}/LENOVO/21BX/adspr.jsn (100%)
> >  rename qcom/{ => sc8280xp}/LENOVO/21BX/adspua.jsn (100%)
> >  rename qcom/{ => sc8280xp}/LENOVO/21BX/battmgr.jsn (100%)
> >  rename qcom/{ => sc8280xp}/LENOVO/21BX/cdspr.jsn (100%)
> >  rename qcom/{ => sc8280xp}/LENOVO/21BX/qcadsp8280.mbn (100%)
> >  rename qcom/{ => sc8280xp}/LENOVO/21BX/qccdsp8280.mbn (100%)
> >  rename qcom/{ => sc8280xp}/LENOVO/21BX/qcdxkmsuc8280.mbn (100%)
> >  rename qcom/{ => sc8280xp}/LENOVO/21BX/qcslpi8280.mbn (100%)
> >
> > diff --git a/WHENCE b/WHENCE
> > index f5aa93cd3726..f3f9a7a93cde 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -5595,7 +5595,7 @@ File: qcom/a660_gmu.bin
> >  File: qcom/a660_sqe.fw
> >  File: qcom/leia_pfp_470.fw
> >  File: qcom/leia_pm4_470.fw
> > -File: qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
> > +File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
> >
> >  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
> >
> > @@ -5622,13 +5622,14 @@ File: qcom/sm8250/adspr.jsn
> >  File: qcom/sm8250/adspua.jsn
> >  File: qcom/sm8250/cdsp.mbn
> >  File: qcom/sm8250/cdspr.jsn
> > -File: qcom/LENOVO/21BX/adspr.jsn
> > -File: qcom/LENOVO/21BX/adspua.jsn
> > -File: qcom/LENOVO/21BX/battmgr.jsn
> > -File: qcom/LENOVO/21BX/cdspr.jsn
> > -File: qcom/LENOVO/21BX/qcadsp8280.mbn
> > -File: qcom/LENOVO/21BX/qccdsp8280.mbn
> > -File: qcom/LENOVO/21BX/qcslpi8280.mbn
> > +File: qcom/sc8280xp/LENOVO/21BX/adspr.jsn
> > +File: qcom/sc8280xp/LENOVO/21BX/adspua.jsn
> > +File: qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
> > +File: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
> > +File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
> > +File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
> > +File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
> > +Link: qcom/LENOVO/21BX -> ../sc8280xp/LENOVO/21BX
> >
> >  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
> >
> > diff --git a/qcom/LENOVO/21BX/adspr.jsn b/qcom/sc8280xp/LENOVO/21BX/adspr.jsn
> > similarity index 100%
> > rename from qcom/LENOVO/21BX/adspr.jsn
> > rename to qcom/sc8280xp/LENOVO/21BX/adspr.jsn
> > diff --git a/qcom/LENOVO/21BX/adspua.jsn b/qcom/sc8280xp/LENOVO/21BX/adspua.jsn
> > similarity index 100%
> > rename from qcom/LENOVO/21BX/adspua.jsn
> > rename to qcom/sc8280xp/LENOVO/21BX/adspua.jsn
> > diff --git a/qcom/LENOVO/21BX/battmgr.jsn b/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
> > similarity index 100%
> > rename from qcom/LENOVO/21BX/battmgr.jsn
> > rename to qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
> > diff --git a/qcom/LENOVO/21BX/cdspr.jsn b/qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
> > similarity index 100%
> > rename from qcom/LENOVO/21BX/cdspr.jsn
> > rename to qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
> > diff --git a/qcom/LENOVO/21BX/qcadsp8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
> > similarity index 100%
> > rename from qcom/LENOVO/21BX/qcadsp8280.mbn
> > rename to qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
> > diff --git a/qcom/LENOVO/21BX/qccdsp8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
> > similarity index 100%
> > rename from qcom/LENOVO/21BX/qccdsp8280.mbn
> > rename to qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
> > diff --git a/qcom/LENOVO/21BX/qcdxkmsuc8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
> > similarity index 100%
> > rename from qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
> > rename to qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
> > diff --git a/qcom/LENOVO/21BX/qcslpi8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
> > similarity index 100%
> > rename from qcom/LENOVO/21BX/qcslpi8280.mbn
> > rename to qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
> > --
> > 2.35.1
> >
