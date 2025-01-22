Return-Path: <SRS0=4RAj=UO=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F91AC02182
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Jan 2025 00:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D51DC4CEDF; Wed, 22 Jan 2025 00:53:54 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0AD1C4CEE2
	for <linux-firmware@kernel.org>; Wed, 22 Jan 2025 00:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0AD1C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54021daa6cbso6937481e87.0
        for <linux-firmware@kernel.org>; Tue, 21 Jan 2025 16:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737507231; x=1738112031; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BiTtIZ5CQjnnz9mZnZ+aQHenLI272iD29a83vlBbcFI=;
        b=IZ7vNDGRBPBeuO2yMQixU6g85G3mhSZ4z2go/Ozlh0sfB2DBTFB49NTHNHcsMAA29l
         b//ipk9xFHsFemJa70iCDRRGZAK7TOFQmX1Ap6ilKLUhbj/2p0FAjXCIaRad7R16eFQ5
         N46beruVLdY8/jVOq1HSla7I7atdtBlL9BxCD1VM3jRPdLYdAZIoTGPDXiIzE+spsOma
         gj9h5T81V0QXFqqfJKrKWHIIPioFQi7mqcba9SxeRtoRBxsLnnaI3sL/18VJ2T9oSqBT
         YVQJUHnfS838x00vXAJa+edmLvQAJfbcr1q8b1DhuFu9Tv+psfnAAszmKw8EVNJR1lxc
         5ASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737507231; x=1738112031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiTtIZ5CQjnnz9mZnZ+aQHenLI272iD29a83vlBbcFI=;
        b=U+REYcWTM9sGrLXlfMsmzanFu/XKTUDI4lpGXhkwwnaJiGGLeNg6itHQXSvFRzvrbA
         naBplOCgTUWQRCkDKnColI9egqs0rmUjcnZ1k7ObpDDfTtahehqDGKrd3Xm54v2lLegr
         mhZGZG4X4X6i7D33BjWYjFAAs1XrjywTn5vHgoNItGe8Fdd4ypyrDnvoU5lSPL2l59gV
         JsTh3vQfUMA5//4IKKu5OiRLfGilTrKtxJK9TeoYsZnJPo9t7tYBn7bM4439ahuJO9j5
         0RMsYF9XP+IXu1O8hzcHe1SAakq7/IoNNXkYsOmyRp9Fi6awad0iUvHRV4UGroPIyvFV
         hJmg==
X-Gm-Message-State: AOJu0Yw/deGxaISUa0no/3dBXiYvblhrM6TCKJW2CvmmT09o2iv+jWjf
	rPamCYLVlSGtWPuxx5eQaMz274FrFUIBzRSL+nLLKyg86eIchOMEuwn0Phcx528ZhMsT11WIbYe
	UDzk=
X-Gm-Gg: ASbGncsCId1YB07Z9OrgRMfuP0lNo64yn8LVugqiCXtF2ulMLHY2zzzWfMRG9OEGQni
	IhEbLjqEehwL0MzreKtLY7G/KI8/p/HW5zrcf0FKt0z1vPau4F490VqBwVmACBprp12f9+QA5mE
	+OyFyX5hHLNDk3w7rbDW6GOPE4HRORkHonbYyTAhVSnQNsug72wYh2lierRaB3s5LFRrMNiCBec
	77/EuTToaBGJmeixkHH4tsVDpUVcVizBE8xWoIKo7+aaD4co1NB0Mj+gGVEB6+dcH/TXkdurTY6
	hJz+QNqTzlgPhQtqKO9RmAPB/RGKjPlcB3jPl3XTwU6ASm9jRw==
X-Google-Smtp-Source: AGHT+IFU4JcpTlvA/kz5qnmDpL5f0NZoslt4uip2sC+Ewyx7a0pvsQRyyVxV6Ed7KWkxh8yp+zA57Q==
X-Received: by 2002:a05:6512:7b:b0:540:1e51:b919 with SMTP id 2adb3069b0e04-5439c2539efmr6004546e87.31.1737507230941;
        Tue, 21 Jan 2025 16:53:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0757dsm2028575e87.23.2025.01.21.16.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 16:53:49 -0800 (PST)
Date: Wed, 22 Jan 2025 02:53:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: QCA: Add Bluetooth firmware for QCA6698 request-pull
Message-ID: <vjxdrqynnxdqkr5efmi2qyxowbv3bs6xsmt55mzgfyydze2mmt@xtevzhgq6z4g>
References: <f8324c4c-985b-4283-922d-1f0de766fde3@quicinc.com>
 <4zg574wtssuevuhqgaul4jsseyfycbvjyeau4h23uv5x66s7xc@2axqtbzvphub>
 <d954eb99-cdb7-4308-a677-aaf5a14feed4@quicinc.com>
 <CAA8EJppnBK7oqsnV8evEBpBmUbSwX3itjWjFpUYfg7_gX642cw@mail.gmail.com>
 <301f6627-fb10-4b24-927e-32b6e2646516@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <301f6627-fb10-4b24-927e-32b6e2646516@quicinc.com>

On Wed, Jan 22, 2025 at 08:46:43AM +0800, Cheng Jiang wrote:
> 
> 
> On 1/21/2025 4:07 PM, Dmitry Baryshkov wrote:
> > On Tue, 21 Jan 2025 at 04:39, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
> >>
> >> Hi Dmitry,
> >>
> >> On 1/20/2025 5:34 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Jan 20, 2025 at 05:13:17PM +0800, Cheng Jiang (IOE) wrote:
> >>>> Hi linux-firmware maintainers,
> >>>>
> >>>> Here's a pull request for btqca bluetooth firmware. Please let me know if you have any problems.
> >>>>
> >>>> The following changes since commit a28a9226ccb8bf393b8e7dd8970a4d967c1a1d92:
> >>>>
> >>>>   Merge branch 'robot/pr-0-1736646402' into 'main' (Mon Jan 13 14:30:09 2025 +0000)
> >>>>
> >>>> are available in the git repository at:
> >>>>
> >>>>   https://github.com/che-jiang/qca_btfw
> >>>>
> >>>> for you to fetch changes up to c07a64c0f9348b1da997c944467857d73a6fa8cb:
> >>>>
> >>>>   QCA: Add Bluetooth firmware for QCA6698 (Mon Jan 20 16:58:47 2025 +0800)
> >>>>
> >>>> ----------------------------------------------------------------
> >>>>  Cheng Jiang (1):
> >>>>
> >>>>     QCA: Add Bluetooth firmware for QCA6698
> >>>>
> >>>>     This commit will add required Bluetooth firmware files for QCA6698
> >>>>     The image version is 2.1.2-00035.
> >>>
> >>> Please confirm whether these files should be using LICENSE.qcom or
> >>> LICENSE.QualcommAtheros_ath10k?
> >> Thank you for review this, it should be LICENSE.qcom.
> >>>
> >>> Also please include into the commit message an explanation that was
> >>> shared together with the kernel patches so that nobody is surprised by
> >>> the subdir and the firmware names.
> >> Ack.
> >>>
> >>>
> >>>>
> >>>>     hpbtfw21.tlv : RAM FW dump
> >>>>     hpnv21.b206  : NVM dump
> >>>>     hpnv21.b207  : NVM dump
> >>>
> >>> Which platforms are these two files for?
> >> Currently there are two connectivity boards using QCA6698, the board id
> >> are 206 and 207 respectively. So add two board specific nvm files here.
> > 
> > Connectivity boards for ... ?
> > 
> Connectivity boards for sa8775p-ride platform. Here is the dts changes. 
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20250110063914.28001-2-quic_chejiang@quicinc.com/

Commit message, please.

> 
> And the driver changes:
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=8c6fb157eb03
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=ad3f4635a796
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=be6ff38d6852
> 
> 
> >>>
> >>>>     hpnv21.bin   : NVM dump
> >>>>
> >>>
> >>
> > 
> > 
> 

-- 
With best wishes
Dmitry
