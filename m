Return-Path: <SRS0=mrzO=VL=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C532CC021B1
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Feb 2025 10:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE2F2C4CEDD; Thu, 20 Feb 2025 10:20:51 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AC06C4CED1
	for <linux-firmware@kernel.org>; Thu, 20 Feb 2025 10:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6AC06C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f4b266d333so5035087b3.2
        for <linux-firmware@kernel.org>; Thu, 20 Feb 2025 02:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740046849; x=1740651649; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NSoLtKV0w4z5faZ2bHEhB1GN+c3XqPTU7GGlwFoL8hA=;
        b=BcWlt+1HiVTxlT98Z2lBiPCyCgRlWf/qA2jsdGtLydAYxChxZ0KHsQAZpu2bGVJDTa
         MhFyQoGPlmcriDdAUqMNFX0Taeioe8HCJ0qmZThTMyKX6E8TCa4vHNS/DCG0qS69Dror
         zk+Dfat91RvtZg6uTB63C7g2C5jgPFL1uQGdXaM4Ruygt2pWjpIvO/54zr0f+x7kgHo7
         nXtSIUEMylg4mp2Hl77nVsG2I2WLao059NpqRlO/yClzd2+0nx8lqpCIWrHp1Lo9BKMH
         bTj/wVU3ejckMllpCQfdLrjLSk725Hah7mufXHRt9O20qpOJkGXkE8vh+lQYMT+cDgQ1
         J7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046849; x=1740651649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSoLtKV0w4z5faZ2bHEhB1GN+c3XqPTU7GGlwFoL8hA=;
        b=D5Ear03q5t6cA7kmJBArdaO1ekno2FVLgYDxxo5muI77t17jTVOlCpfVY2n6fWmm4T
         Ur3Kp7rDJf3cIaGj0135JFGxFUZ8sRLDfY7th0dF3NfT6imIx7LUm1igZESFLYXhoDR9
         tMcF+TlE+DJTLa3xJRIDIOPApcR7iqSk/TCBbLqSZ6qemXoMKeBwfIhN9Ct2+CJDskU5
         TABgDohc3SWVHS+7+LG8SOTEGqFmYb80qMUM0NvYTVp7aH3KVWZxwgEiOALyupgLIgW1
         TY7Q26y9Ng2l1GLY4M7ZWqmDlSxQAuXmPPZ9Jxhqp4wncqXopTYObF4JlXxfazQb4hPZ
         l3Qw==
X-Gm-Message-State: AOJu0Yz+pKx+oZ6DVIhWFpmYk6CGYHAxs0ghwazI8EwFN3eUHCjAbJV+
	TE0EVYnk01TUqEElRm6IiHeS4/jXticpzid4iL907/4Y4aDGuL4xK8rTXlsVbufMDDPGVEIAvn8
	EluuUdzDuVmy3ZeMrWQw7UWj+lQIE+utlV6yzOA==
X-Gm-Gg: ASbGncusv0//KKAvngJSRaxRYtUTaxjt0Q6IdzjNYyM52A4JW0R02Z9IbMMoevga644
	GWFVdWDuRcRKhqmQvdqJ2+lz2Bk8zQrpCphtUGV6uQ0FdK8Qv5KM1kbsiPNAuJxQk8+O0xdJsKJ
	5UQ5AIzVftrJA=
X-Google-Smtp-Source: AGHT+IH8BQ2YGvXDRYVgb96eeRGifMhBcyW+mk2jr6XLuDKRTwIoZd/hpYFyzCaUjcPg5SN/5+CXeovJyLYTCL5M3bM=
X-Received: by 2002:a05:690c:6e11:b0:6f9:8916:3b66 with SMTP id
 00721157ae682-6fb5829ba0emr188868967b3.12.1740046849202; Thu, 20 Feb 2025
 02:20:49 -0800 (PST)
MIME-Version: 1.0
References: <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>
 <cz6nu7fuf23poqahslmnqisuiqakjzkmwvk2znvohmjrnvgfhs@wb4wkugrkgfm>
 <e02e6eb7-9af5-87a2-a7f0-248d9c7543c2@quicinc.com> <CAA8EJpoagdAXE7L7qG9vQCkJbJ-MnB0LaYtqAoa8yLgj91O9ug@mail.gmail.com>
 <4fb0d093-d00c-13cd-9dba-7393dbcf897c@quicinc.com> <nh2uwme4p6ytatr5mindtfryvm524nhdi5hmyvyb6w3qnmeqsc@2umcnv7g6enn>
 <b6979c75-cbc2-6f00-adee-4bb47d8b63cf@quicinc.com> <nxsukcd5vulgyvmlhiej2xswetbvkh2ue6lpamp44bx3vmmccb@42xufw3xwbg4>
 <20bf354a-aac9-514a-aa8a-f313e569a4cd@quicinc.com> <plfoqdkuuczjvnz2wcd4ewfgahtabztmfgehpnhvpdpbyrlkjn@esr2cieq62be>
 <dtu6f4nnutcufgu4n2rbbwvyywsl4sqarfstqrbl6i25kjlnvl@w33shxkpqtze> <67e51c53-c55a-0c19-d8d4-2447472c6815@quicinc.com>
In-Reply-To: <67e51c53-c55a-0c19-d8d4-2447472c6815@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:20:38 +0200
X-Gm-Features: AWEUYZnsOgqMZVGNxHb8mDViblalkBd5gHq59-wdO0nGS8Y2OeY64KJmx-D9NYA
Message-ID: <CAA8EJpo8pzwBb4tRiy041su3Y9XfOnMCBpQfTyy+ONCRUdGwcA@mail.gmail.com>
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 12:18, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
>
>
> On 2/9/25 19:17, Dmitry Baryshkov wrote:
> > On Wed, Jan 08, 2025 at 01:56:37PM +0200, Dmitry Baryshkov wrote:
> >> On Wed, Jan 08, 2025 at 10:19:29AM +0530, Sibi Sankar wrote:
> >>>
> >>>
> >>> On 1/7/25 04:12, Dmitry Baryshkov wrote:
> >>>> On Mon, Jan 06, 2025 at 05:42:55PM +0530, Sibi Sankar wrote:
> >>>>>
> >>>>>
> >>>>> On 12/17/24 16:26, Dmitry Baryshkov wrote:
> >>>>>> On Tue, Dec 17, 2024 at 03:13:06PM +0530, Sibi Sankar wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 12/5/24 16:49, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, 5 Dec 2024 at 12:07, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 11/29/24 20:07, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Tue, Oct 22, 2024 at 11:49:37AM +0530, Sibi Sankar wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> On 10/18/24 21:23, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Fri, Oct 18, 2024 at 08:58:06PM +0530, Sibi Sankar wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On 10/18/24 16:13, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>> On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Hello,
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>          Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
> >>>>>>>>>>>>>>> +0000)
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> are available in the Git repository at:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>          https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>>>>>>>>>>>>> adsp-fw-x1e80100-crd
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
> >>>>>>>>>>>>>> Windows firmware has it in adspr.jsn.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Hey Dmitry,
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Can you please share what device and META you are comparing this
> >>>>>>>>>>>>> firmware against? This firmware was taken from the build source
> >>>>>>>>>>>>> without any modification.
> >>>>>>>>>>>>
> >>>>>>>>>>>> I have been looking at the Windows driver from WSU for the CRD,
> >>>>>>>>>>>> qsubsys_ext_adsp8380.cab. DriverVer = 08/27/2024,2.0.4114.4600.
> >>>>>>>>>>>>
> >>>>>>>>>>>> For the reference, I checked several last drops, they have the following
> >>>>>>>>>>>> versions of qcadsp8380.mbn:
> >>>>>>>>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00792-HAMOA-1
> >>>>>>>>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00789.1-HAMOA-1
> >>>>>>>>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00787.2-HAMOA-1
> >>>>>>>>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00784-HAMOA-1
> >>>>>>>>>>>> QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00781-HAMOA-1
> >>>>>>>>>>>>
> >>>>>>>>>>>> All of them list tms/pdr_enabled in adspr.jsn
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Thanks for listing them. Already following up internally regarding
> >>>>>>>>>>> this discrepancy, will push out an update once it gets resolved.
> >>>>>>>>>>
> >>>>>>>>>> Sibi, this has been more than a month ago. Could you please update us on
> >>>>>>>>>> the pdr_enabled necessity? I'm asking since it's also a part of the
> >>>>>>>>>> kernel data nowadays.
> >>>>>>>>>
> >>>>>>>>> Hey Dmitry,
> >>>>>>>>>
> >>>>>>>>> Extremely sorry for the delay. I was told this is just a platform
> >>>>>>>>> specific flag that we can decide to turn on if it handles PDR.
> >>>>>>>>> Given that linux does handle PDR we can safely turn it on.
> >>>>>>>>
> >>>>>>>> So... is there any reason why it wasn't set previously? Which
> >>>>>>>> platforms should have it in the enabled state?
> >>>>>>>
> >>>>>>> We had just pushed out the firmware out without modification
> >>>>>>> but yes like you say it could have been turned on during the
> >>>>>>> initial push itself since linux supports pdr.
> >>>>>>
> >>>>>> Pushed out where? Also could you please respond to the questions rather
> >>>>>> than ignoring them?
> >>>>>
> >>>>> All SoCs that has remoterprocs booting pds can have tms/pdc enabled in
> >>>>> linux since it has pdr support merged. The firmware that I said was
> >>>>> pushed out was the firmware passed onto me for merge into linux-
> >>>>> firmware. Sry I thought it was already clear, didn't mean to avoid
> >>>>> answering any questions.
> >>>>
> >>>> So, should we enable the pdr_enabled for all those PDs or should we
> >>>> ignore the flag and drop it from the configurations where it has been
> >>>> added? The information that you are providing doesn't help me with that
> >>>> question.
> >>>
> >>> Yes, we should list tms/pdr as enabled because without that I was told
> >>> the entire Q6 would go down instead of just the pd i.e. without that
> >>> the Q6 assumes that the platform doesn't support pd restart and tears
> >>> down everything including the root.
> >>
> >> Starting from which platform? Should it be enabled for msm8996?
> >
> > Sibi, we haven't heard from you for a month. Should pdr_enabled be set
> > for all platforms and all domains?
>
> I tried tracking this down but all we would end getting is a verbal
> ack from people who weren't even working in qc when those SoCs were
> out. Instead we can rely on testing it out with/without the flag
> enabled i.e. with the flag enabled you should just see pd restart
> without the remote processor going down as well. AFAIK the first
> time pd was introduced was with modem and wlan on MSM8998. As for

MSM8996 / APQ8096 had PDs for ADSP and modem.

> the test procedure you can use the send_data command to trigger
> a pdr instead of a SSR i.e. send_data 75 37 03 144 00 to trigger
> a pdr as described in the original cover letter of pdr_interface.
>
> -Sibi
>
> >



-- 
With best wishes
Dmitry
