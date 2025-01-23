Return-Path: <SRS0=8m+k=UP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B2AC0218B
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Jan 2025 07:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33F1CC4CED3; Thu, 23 Jan 2025 07:49:08 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 037CCC4CEE1
	for <linux-firmware@kernel.org>; Thu, 23 Jan 2025 07:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 037CCC4CEE1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54024aa9febso676237e87.1
        for <linux-firmware@kernel.org>; Wed, 22 Jan 2025 23:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737618545; x=1738223345; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ES8gUE1+zaeXqkzCKnDFFMCGl0ro1/RvKCLNtRRPtE=;
        b=RY1oLxASynzhEEij22OgoezvB0e0/YTsOKhQ8nTj8qpl6syKGMxozE0zKB9lL/obDC
         fQzIBn0fNbptOawjj8EmdbG+6hLX3E5qLaC26i5ZFnENH36Y1KXp9J33wqAVk3E+qUgF
         uRK0ekrK5fASGq774e2ZTM0bc6DsKYVPoKDRh+Vu0IBNRXTOGQHfDQwqoxxyWE1RNQRO
         SaP0eK4x5ovtD4iQ8gPBDeSAnw5N0NoXdXDDAsvlL+vUqIBHi61DGjheIUsngVZvuTOR
         Y43hn1Ug8Nvsg5EbqYEk7ovRjZe7kL/NB3wz3e1LujhjAWZmfxy7jzNlOVeonBglGB1w
         WYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737618545; x=1738223345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ES8gUE1+zaeXqkzCKnDFFMCGl0ro1/RvKCLNtRRPtE=;
        b=u9+/+xz64I52cUYigHctYgtX4z5cMTs/sIrV53u4y5U2jdjtpfHdohBZAcrmZBEXok
         uEd+y/zQRaV3ZertiFiLbCFRDgZoJEr3aceSQbcs7u81ADKuOiGuo5pshN8t2EGa6j5g
         WECtqLcJiTFBFHF3eeML+REVLHhre9HIg0MDmizFBJBTMqI3JXAh6daLx4VDf7YKLfkw
         Sq0UwGSlBkZ2UIfgfOr2aatVoqhBWa6HUlnnfHDm0P/ywYTkPVLK9hsgKCLRbiMCtEoZ
         W8dJSBrvDZXAsJ9kXleqQ+eoEymIwtZITGx6ce86R3po9z4wvQApal6/0V4T6kiNSFIa
         zuLg==
X-Gm-Message-State: AOJu0Yy0og8Gg9iqTZwoszAK+5V+J9yYGkzJuRxu3EHcHo8wM9UQUeP+
	q+WraIJBbUA5DoGYwb3WGXLDeLbYy1hqHutKx1iNtcOvjMAqA3AJdQIYCDj9ZLzhf3st3rWQAMz
	x6jA=
X-Gm-Gg: ASbGncuIcEc7d14TMpgovdfM/kR/V82uKVlLC7Pb1uKoH53Jp+gAUBSf8ygIL3ztJZ5
	gyznVN+mIxNnSdmCpncDs5c+lWDVRp58y0RuYK6XjKw0aR4LZlADG8mBviC07fnBQB+kol9/duI
	lgV07FlpzCC2k+xcaLEDzh9haG639fbOMYSr+q4TS4w99BpHHQ/QgdeUgdfn4jy4kzyU8BLMMDm
	W0milZkfMIfV4L8Y3y81bY2huwyS8TXiPMjhLZ60iWAeQU0dJtPjC9e6mMLaRBDAObay2hjQz8O
	xcg/HKv/fUA5xRu70xxGd9sJfR+d2E5SiGWVGtCCBXaxZv0sk3c/Fpzwo5db
X-Google-Smtp-Source: AGHT+IEkyn4ejmd/p5JZWyYItN2df6Fmw1EAlH7rS+PiGN4H9LocJFmMijwD1Sf8gCj6Tpl5aS6zxA==
X-Received: by 2002:a05:6512:10d5:b0:542:2a28:e30f with SMTP id 2adb3069b0e04-5439c25370cmr8953395e87.31.1737618544907;
        Wed, 22 Jan 2025 23:49:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af790cbsm2516602e87.250.2025.01.22.23.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 23:49:03 -0800 (PST)
Date: Thu, 23 Jan 2025 09:49:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: QCA: Add Bluetooth firmware for QCA6698 request-pull
Message-ID: <louhigsmkfff7jsfunwwev4iibz4yxmbfobicwdf2n5fymtx6u@vmxrlt5ddwzy>
References: <f8324c4c-985b-4283-922d-1f0de766fde3@quicinc.com>
 <4zg574wtssuevuhqgaul4jsseyfycbvjyeau4h23uv5x66s7xc@2axqtbzvphub>
 <d954eb99-cdb7-4308-a677-aaf5a14feed4@quicinc.com>
 <CAA8EJppnBK7oqsnV8evEBpBmUbSwX3itjWjFpUYfg7_gX642cw@mail.gmail.com>
 <301f6627-fb10-4b24-927e-32b6e2646516@quicinc.com>
 <vjxdrqynnxdqkr5efmi2qyxowbv3bs6xsmt55mzgfyydze2mmt@xtevzhgq6z4g>
 <defe5429-98cd-467e-86bb-3e848db19098@quicinc.com>
 <375wp6vzjho3eu3guzjxajixvmumop5e3m6aqhgpgrqkxr4lhx@tsoarhsqmcan>
 <0434d052-83f2-40f6-8e10-d6171458dd03@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0434d052-83f2-40f6-8e10-d6171458dd03@quicinc.com>

On Thu, Jan 23, 2025 at 08:22:30AM +0800, Cheng Jiang wrote:
> Hi Dmitry,
> 
> On 1/23/2025 2:50 AM, Dmitry Baryshkov wrote:
> > On Wed, Jan 22, 2025 at 06:39:15PM +0800, Cheng Jiang wrote:
> >> Hi Dmitry.
> >>
> >> On 1/22/2025 8:53 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Jan 22, 2025 at 08:46:43AM +0800, Cheng Jiang wrote:
> >>>>
> >>>>
> >>>> On 1/21/2025 4:07 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, 21 Jan 2025 at 04:39, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
> >>>>>>
> >>>>>> Hi Dmitry,
> >>>>>>
> >>>>>> On 1/20/2025 5:34 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, Jan 20, 2025 at 05:13:17PM +0800, Cheng Jiang (IOE) wrote:
> >>>>>>>> Hi linux-firmware maintainers,
> >>>>>>>>
> >>>>>>>> Here's a pull request for btqca bluetooth firmware. Please let me know if you have any problems.
> >>>>>>>>
> >>>>>>>> The following changes since commit a28a9226ccb8bf393b8e7dd8970a4d967c1a1d92:
> >>>>>>>>
> >>>>>>>>   Merge branch 'robot/pr-0-1736646402' into 'main' (Mon Jan 13 14:30:09 2025 +0000)
> >>>>>>>>
> >>>>>>>> are available in the git repository at:
> >>>>>>>>
> >>>>>>>>   https://github.com/che-jiang/qca_btfw
> >>>>>>>>
> >>>>>>>> for you to fetch changes up to c07a64c0f9348b1da997c944467857d73a6fa8cb:
> >>>>>>>>
> >>>>>>>>   QCA: Add Bluetooth firmware for QCA6698 (Mon Jan 20 16:58:47 2025 +0800)
> >>>>>>>>
> >>>>>>>> ----------------------------------------------------------------
> >>>>>>>>  Cheng Jiang (1):
> >>>>>>>>
> >>>>>>>>     QCA: Add Bluetooth firmware for QCA6698
> >>>>>>>>
> >>>>>>>>     This commit will add required Bluetooth firmware files for QCA6698
> >>>>>>>>     The image version is 2.1.2-00035.
> >>>>>>>
> >>>>>>> Please confirm whether these files should be using LICENSE.qcom or
> >>>>>>> LICENSE.QualcommAtheros_ath10k?
> >>>>>> Thank you for review this, it should be LICENSE.qcom.
> >>>>>>>
> >>>>>>> Also please include into the commit message an explanation that was
> >>>>>>> shared together with the kernel patches so that nobody is surprised by
> >>>>>>> the subdir and the firmware names.
> >>>>>> Ack.
> >>>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>>     hpbtfw21.tlv : RAM FW dump
> >>>>>>>>     hpnv21.b206  : NVM dump
> >>>>>>>>     hpnv21.b207  : NVM dump
> >>>>>>>
> >>>>>>> Which platforms are these two files for?
> >>>>>> Currently there are two connectivity boards using QCA6698, the board id
> >>>>>> are 206 and 207 respectively. So add two board specific nvm files here.
> >>>>>
> >>>>> Connectivity boards for ... ?
> >>>>>
> >>>> Connectivity boards for sa8775p-ride platform. Here is the dts changes. 
> >>>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20250110063914.28001-2-quic_chejiang@quicinc.com/
> >>>
> >>> Commit message, please.
> >>>
> >> Ack.
> >> Here is the new commit id a55049bb0691bc5c0f800a0a32ab0445f5de9b8e on
> >> https://github.com/che-jiang/qca_btfw  
> >> Could you please help to review? Thanks! 
> > 
> > I'd drop the DTS link. Looks good to me otherwise.
> > 
> Thank you! I updated the commit message in 52e961830b8eb7c7c7c36adbaac32fef71726251.

LGTM

> >>
> >>>>
> >>>> And the driver changes:
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=8c6fb157eb03
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=ad3f4635a796
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=be6ff38d6852
> >>>>
> >>>>
> >>>>>>>
> >>>>>>>>     hpnv21.bin   : NVM dump
> >>>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>
> >>>>>
> >>>>
> >>>
> >>
> > 
> 

-- 
With best wishes
Dmitry
