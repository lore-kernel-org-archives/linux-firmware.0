Return-Path: <SRS0=4RAj=UO=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A904C02181
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Jan 2025 18:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6984C4CEE1; Wed, 22 Jan 2025 18:50:26 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19873C4CED2
	for <linux-firmware@kernel.org>; Wed, 22 Jan 2025 18:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19873C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54021daa6cbso151470e87.0
        for <linux-firmware@kernel.org>; Wed, 22 Jan 2025 10:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737571823; x=1738176623; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q6zkBHwJJKz3D9hNIWQSbGQKGXoa9TzdN1EXNnRi+2o=;
        b=oEu8yHBPGbYgpPc1abox2Nm4issRwgRl+EZngY1GpcfFtgj8cduMVaF0SROUZghYYv
         4imlCHUMMuN7gDnUxdvbyNknD9I1lwOa9/grRZJc42rNd3qmfY/b0XV9pOo1Is91Qfgt
         TYkFKTfSEgxO5FurIDiH51vGfND2Z4+HsjLRrIuUkMPWpRP2VnExooDN0n/d6TvFN8B3
         R1CJFXv0qFiqoJs04aJY5TZCWQuMN+v8qFssysRzBugy84Dj9BYNzYoSAEtgaMdgeV0D
         AAtjCMTEk8WeKV8Yj2bIAFKQwYN1ikJymIPeaDw+zAgQZ+NNi673mGIC2Zr1RtkiZ8xg
         jbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737571823; x=1738176623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6zkBHwJJKz3D9hNIWQSbGQKGXoa9TzdN1EXNnRi+2o=;
        b=cpwnNQC7vi1TreNEhRmEklBmBsOvG5T1b4N+6my5eXNNN6SwE/8jETMNwgRwGsL01V
         7CJ0furzzNWjtoUeyg0ol//aF8Cr5pojdmmJu8XP0YMUqRGzLMVCjhJRuTqLp7/rYA0t
         3UQVSXOCJBWfKroJPQsFyYSTtENLWiOIU++gNLtW1A9amSxbL22GtGwcbp8e+UDl6H7g
         /vDBBGqUjGwWf69tMQT3AZbbvyKAO7X+2tIT4/jjCKTAKX5fAGgRUAQ4+tkUPoZAY8Zh
         TftCDlpyPSWVQHJ4Dne03K5ANJLp+WH//nHKrpQHz4bexXTHlaNPflCnYY3Hlir8wB/2
         NrUQ==
X-Gm-Message-State: AOJu0YytAMhkREV1dAgz3Aym5CwFbLKxLqMHaoW96LUn1pA6OUABbLaV
	ljO2+XoXT5KVJ0vl0kGekIot60VQvxcuwQJ5AXqmc+3EplMlkGZbcVal4dL8b0qJxvhGAJ9M0d+
	DH3k=
X-Gm-Gg: ASbGncuGPVOtnPnhEXPEKPoRhEwIU5p0AZ+kRmdcUgtrBZhXoZZrS3GaIuSFq0s3OQm
	61pSWOrbh+/NQjCLgbN7X5wFxZ39ws5I52hr3kL0eAgdmsetwwXQ4cThT/E4JP0TdjvdF15yNyq
	4Nauc/VZuMTmi15uECwCsebDD65LKijkhXDFdGcemV5w+R/XJCAKv1kiWfQvMsQ9c+GvWe3pCcI
	kUFyhHCGvTWpx7kk8HiRuC3jXirm/XmHlr6hoCvUcoaKMfLRkXvU/J+dSNlKTwrH0iKz9auuuz1
	aD3sFMEWXd1yLekBWEUZIGKYUz1YcyeQOIM2WiCYSSFKitxlyw==
X-Google-Smtp-Source: AGHT+IEs+TxPR58QjSVmVC37CfIH1xsoXu5JGldQa/HbsY+sK6qqXNSJU4UvbVNBU5cTzVNd6zrT+g==
X-Received: by 2002:a05:6512:3c98:b0:541:1c48:8bf6 with SMTP id 2adb3069b0e04-5439c28e355mr7478120e87.53.1737571823106;
        Wed, 22 Jan 2025 10:50:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e8d4sm2305591e87.64.2025.01.22.10.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:50:21 -0800 (PST)
Date: Wed, 22 Jan 2025 20:50:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: QCA: Add Bluetooth firmware for QCA6698 request-pull
Message-ID: <375wp6vzjho3eu3guzjxajixvmumop5e3m6aqhgpgrqkxr4lhx@tsoarhsqmcan>
References: <f8324c4c-985b-4283-922d-1f0de766fde3@quicinc.com>
 <4zg574wtssuevuhqgaul4jsseyfycbvjyeau4h23uv5x66s7xc@2axqtbzvphub>
 <d954eb99-cdb7-4308-a677-aaf5a14feed4@quicinc.com>
 <CAA8EJppnBK7oqsnV8evEBpBmUbSwX3itjWjFpUYfg7_gX642cw@mail.gmail.com>
 <301f6627-fb10-4b24-927e-32b6e2646516@quicinc.com>
 <vjxdrqynnxdqkr5efmi2qyxowbv3bs6xsmt55mzgfyydze2mmt@xtevzhgq6z4g>
 <defe5429-98cd-467e-86bb-3e848db19098@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <defe5429-98cd-467e-86bb-3e848db19098@quicinc.com>

On Wed, Jan 22, 2025 at 06:39:15PM +0800, Cheng Jiang wrote:
> Hi Dmitry.
> 
> On 1/22/2025 8:53 AM, Dmitry Baryshkov wrote:
> > On Wed, Jan 22, 2025 at 08:46:43AM +0800, Cheng Jiang wrote:
> >>
> >>
> >> On 1/21/2025 4:07 PM, Dmitry Baryshkov wrote:
> >>> On Tue, 21 Jan 2025 at 04:39, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
> >>>>
> >>>> Hi Dmitry,
> >>>>
> >>>> On 1/20/2025 5:34 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Jan 20, 2025 at 05:13:17PM +0800, Cheng Jiang (IOE) wrote:
> >>>>>> Hi linux-firmware maintainers,
> >>>>>>
> >>>>>> Here's a pull request for btqca bluetooth firmware. Please let me know if you have any problems.
> >>>>>>
> >>>>>> The following changes since commit a28a9226ccb8bf393b8e7dd8970a4d967c1a1d92:
> >>>>>>
> >>>>>>   Merge branch 'robot/pr-0-1736646402' into 'main' (Mon Jan 13 14:30:09 2025 +0000)
> >>>>>>
> >>>>>> are available in the git repository at:
> >>>>>>
> >>>>>>   https://github.com/che-jiang/qca_btfw
> >>>>>>
> >>>>>> for you to fetch changes up to c07a64c0f9348b1da997c944467857d73a6fa8cb:
> >>>>>>
> >>>>>>   QCA: Add Bluetooth firmware for QCA6698 (Mon Jan 20 16:58:47 2025 +0800)
> >>>>>>
> >>>>>> ----------------------------------------------------------------
> >>>>>>  Cheng Jiang (1):
> >>>>>>
> >>>>>>     QCA: Add Bluetooth firmware for QCA6698
> >>>>>>
> >>>>>>     This commit will add required Bluetooth firmware files for QCA6698
> >>>>>>     The image version is 2.1.2-00035.
> >>>>>
> >>>>> Please confirm whether these files should be using LICENSE.qcom or
> >>>>> LICENSE.QualcommAtheros_ath10k?
> >>>> Thank you for review this, it should be LICENSE.qcom.
> >>>>>
> >>>>> Also please include into the commit message an explanation that was
> >>>>> shared together with the kernel patches so that nobody is surprised by
> >>>>> the subdir and the firmware names.
> >>>> Ack.
> >>>>>
> >>>>>
> >>>>>>
> >>>>>>     hpbtfw21.tlv : RAM FW dump
> >>>>>>     hpnv21.b206  : NVM dump
> >>>>>>     hpnv21.b207  : NVM dump
> >>>>>
> >>>>> Which platforms are these two files for?
> >>>> Currently there are two connectivity boards using QCA6698, the board id
> >>>> are 206 and 207 respectively. So add two board specific nvm files here.
> >>>
> >>> Connectivity boards for ... ?
> >>>
> >> Connectivity boards for sa8775p-ride platform. Here is the dts changes. 
> >> https://patchwork.kernel.org/project/linux-arm-msm/patch/20250110063914.28001-2-quic_chejiang@quicinc.com/
> > 
> > Commit message, please.
> > 
> Ack.
> Here is the new commit id a55049bb0691bc5c0f800a0a32ab0445f5de9b8e on
> https://github.com/che-jiang/qca_btfw  
> Could you please help to review? Thanks! 

I'd drop the DTS link. Looks good to me otherwise.

> 
> >>
> >> And the driver changes:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=8c6fb157eb03
> >> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=ad3f4635a796
> >> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=be6ff38d6852
> >>
> >>
> >>>>>
> >>>>>>     hpnv21.bin   : NVM dump
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>>
> >>
> > 
> 

-- 
With best wishes
Dmitry
