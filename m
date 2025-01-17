Return-Path: <SRS0=GkO8=UJ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2E9C02183
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Jan 2025 10:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A7D9C4CEE2; Fri, 17 Jan 2025 10:15:39 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 471A8C4CEDF
	for <linux-firmware@kernel.org>; Fri, 17 Jan 2025 10:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 471A8C4CEDF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5439b0dd4bfso782857e87.0
        for <linux-firmware@kernel.org>; Fri, 17 Jan 2025 02:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737108936; x=1737713736; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZLJ3mm+9gzwxh9OTGLRmzrRO6LI6R7AiTXBLfrqo5KQ=;
        b=GTROq7PtVzvozwOaMRHGJz9UgfwcIqHaFwLIuz675epdNnj509p2/nmsay67xP3J5i
         LvcuSaBzj45lkORaWNIaAYfJpeUcqfesu3I9lCq5wcf50bGuFziGs7loYCiEMKu9Xy2J
         JLEloNyXiEW9p1806Byq8wD0i9N/DK8/lu/SMIuVeZPWveAMF/pnjrnagrnt8KKaekwN
         B5iWSr9EoOu7rd2lYT+LtJJgPT9B6rdN6zpQEXn6Tyg2ZbEkegsgJM6npHzZ8QgdjtaO
         aG0YlNnO1Lw9YW9fnn6tCsxtr0j7/u7trUlfiJI7KYfXUcjGQcFVsriaSrnR+SFuabUZ
         QY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737108936; x=1737713736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLJ3mm+9gzwxh9OTGLRmzrRO6LI6R7AiTXBLfrqo5KQ=;
        b=r8uYeTSOmfXIIIpW/6rnwFJ9MRKEdEIg/HbwBVc/NJeIQjq60c0AGXiDT/jYNHpK6a
         cpFSZjokMMbHKXs9ckLQ/g+FjdaL0qM/f99xwT8IMkK7cSQTbL4aIQ8IJ+Z+pUR51U6M
         PePCoe87x47YMdmk6wENjQbqlGcaqWyTj0fH58FNbUqlHGNueN5bJCNwqwVQ7m33OG8T
         IqdF7xbo8dXfXI8u4tJ2k1veK1S6tQ4zYayHbMtOomg/eD9CLjNMjldTAvSadWMM5AOu
         kpuWW5cMitFne1LcGot+vc4Vdl7yOuw0psQ/OEYo6JdIe0U0NRFX/5bMe4b+3FN++JC9
         St+g==
X-Gm-Message-State: AOJu0YynXtTe3wabLLnMYJFaWPr296zJ8+OM3eKHh1SsolGXxwl/ejzl
	Y5PeMpTLcQAmXoKqyghWDcIZ47+q43A3dnaJenaB1H0u5VdsJf+8lDJWUkWL85o=
X-Gm-Gg: ASbGnct9ECZU+bYv/cZs73j9X47M7+5Yelur7A050ObuWVjA68Zj6uTPB5X9kuxjAvR
	/fW8X9TrkJs+sHAGZCAoGzhebgENoaQUZurtRtco+yBwrqeKLbp5ti07DVu9W6iLpRQOx8zeQ8+
	ok3YuhgttL8O5tFGijIi9l+yh9FR+mqbKJMIl/hmsDLdLS5pKgv6zbR3TlQEbAHBzyT3RPy2VBk
	852gec5uvVlWcDHgPPr9ChW+mHoN4Zb6yRvMkfgtHdwSJz9oDv25P3O7bAW2Lhp9OzIuf4UkDiD
	uFIyiTnbUpo4e5Nm7F3gr9QfiipAXK7WlTHO
X-Google-Smtp-Source: AGHT+IEmasPR/9T0YGTK7xbyOhYbJVixWow3YuEC0Gcc0mKk6l8RsTl5wz9UKi145+QEodBzeW7DSg==
X-Received: by 2002:ac2:5541:0:b0:542:1137:611a with SMTP id 2adb3069b0e04-5439c2461bamr544000e87.17.1737108936359;
        Fri, 17 Jan 2025 02:15:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af7364esm299141e87.162.2025.01.17.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:15:35 -0800 (PST)
Date: Fri, 17 Jan 2025 12:15:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vivek Sahu <quic_vivesahu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, quic_janathot@quicinc.com
Subject: Re: QCA: Update firmware files for BT chip WCN6856
Message-ID: <2cqzso5hkp4t3m3xqrsprt52mhafm6kasjm2hol5b4te23aos2@2uwy7tkaowyv>
References: <57fe5525-8383-4737-ba60-6c9c0c6997f0@quicinc.com>
 <bf08e319-07ae-4f96-92f2-aac8f1a7e136@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf08e319-07ae-4f96-92f2-aac8f1a7e136@quicinc.com>

On Fri, Jan 17, 2025 at 02:27:32PM +0530, Vivek Sahu wrote:
> Hi Team,
> 
> Any update on this ?

I don't see this branch on GitHub. Did you push it in some strange way?

> 
> thanks,
> 
> Vivek K Sahu
> 
> On 1/13/2025 6:19 PM, Vivek Sahu wrote:
> > Hi Team,
> > 
> > Please include firmware bins for WCN6856.
> > 
> > Major contributions : Bug Fixes/Stability.
> > 
> > Snapshot of pull request is as below, let me know if anything is missing.
> > 
> > --------------------------------------------------------------------
> > The following changes since commit
> > ff68bad967033e2973d3a82e5b160813b1d43488:
> > 
> >   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650
> > (2025-01-10 16:33:04 +0530)
> > 
> > are available in the Git repository at:
> > 
> > https://github.com/vivesahu-qcom/bt_hsp_fw.git for/master
> > 
> > for you to fetch changes up to ff68bad967033e2973d3a82e5b160813b1d43488:
> > 
> >   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650
> > (2025-01-10 16:33:04 +0530)
> > 
> > ----------------------------------------------------------------
> > 
> > 
> > Thanks and regards,
> > 
> > Vivek K Sahu
> > 

-- 
With best wishes
Dmitry
