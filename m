Return-Path: <SRS0=5kWZ=TJ=gmail.com=chunkeey@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA50C433EF
	for <linux-firmware@archiver.kernel.org>; Sat, 26 Feb 2022 16:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 914CBC36AE2; Sat, 26 Feb 2022 16:39:27 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3E16C340E8;
	Sat, 26 Feb 2022 16:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3E16C340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id cm8so11554385edb.3;
        Sat, 26 Feb 2022 08:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eH77j8raadPVaGeR/XTLM6vHmIwKR9OlXjwbpcvIVEQ=;
        b=pqhtPA2ZEz+dhnL8Iw7rpagboZsjLyg+R0N791bjIzzO8EsFzOT5Kvj9+lfsumSbY1
         Pg+besS4B1pzKHAgkCopfJMCPyqa84pRmDMMmE+H4MLkKuGE9MxPvOXnLoS2wnjne2A+
         7tNHtX7oJ/e+pEsMniQN3YJXZY55DFQntxK4pTWPgy1pjCUZkQ6qVhUD1JdgmuukaDI0
         WIbBhJM+O9y2t+DpdPrwRx0OYWFx4ZAfezUPdX/BF5ii7LRC7rfEa0LuSo8eiDvMCqmI
         6D+2dVeaLu/z/qIKFtJg6X7XXiSOi8OXeCDB6txh1UuK5dcsu9eFeG6yHVk0UvSq2w+j
         b12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eH77j8raadPVaGeR/XTLM6vHmIwKR9OlXjwbpcvIVEQ=;
        b=GkRsxlEL/wNisyMKJTHUG+AUahv3tiATx5u0VRe3uUY82fFuexC5C6a2uotQYQKezV
         Jz9lVp3eurXM8J5vc3B77onvdzXE1++XLRJKL9W5B/7ZhGhWSt6tO6bgr693qDPNZHF/
         A9SI+RkfeH+FGBvIxUE8htMqvozjc1noFEp4e6ceoenFwxCyigapRICJx3o2CmmZ9O2w
         mGlHQ84E4+PXjtQXsotr8ppt1sGyXhdiwzSrCn96QCDvYD3byzCcpgkhI77xe6AAd2tb
         BiC0rx+fvPjqbVxIeyX+1y97DAFjUqKR0tp8bziK9jZA2ecm90qeJM4c61SG4WAQraLi
         PbGg==
X-Gm-Message-State: AOAM531O8bQH4BzvVOiFaeAori0iEYh2DtDqstiumLh5EcCoE12tiU/3
	/kBiWLF4gmsy/m8hVzj3fCUA5zLUln8=
X-Google-Smtp-Source: ABdhPJz+CyhmDrTOWZ1uH2qhHIWWO+6Z6qo5z7Swx3UcTpFuHmaS6sdtpGiWVwzCQDNJCdQzUiyvdQ==
X-Received: by 2002:aa7:d591:0:b0:411:6c4f:1725 with SMTP id r17-20020aa7d591000000b004116c4f1725mr12014177edq.342.1645893565007;
        Sat, 26 Feb 2022 08:39:25 -0800 (PST)
Received: from debian64.daheim (pd9e29a04.dip0.t-ipconnect.de. [217.226.154.4])
        by smtp.gmail.com with ESMTPSA id n23-20020a509357000000b00412b325b05fsm3003164eda.74.2022.02.26.08.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 08:39:24 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1])
	by debian64.daheim with esmtp (Exim 4.95)
	(envelope-from <chunkeey@gmail.com>)
	id 1nNz9I-0007KG-Mr;
	Sat, 26 Feb 2022 17:39:23 +0100
Message-ID: <fa37099b-4d5b-7265-888c-fae3f48f6e9a@gmail.com>
Date: Sat, 26 Feb 2022 17:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/5] ath10k: QCA4019 hw1.0: update board-2.bin
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, ath10k@lists.infradead.org,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Kalle Valo <kvalo@qca.qualcomm.com>
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com>
 <CA+5PVA5hPn9QDkmwJE3E7NU3hv08t416DfLvxeJFJCxWSzSCDg@mail.gmail.com>
 <87sfs5squm.fsf@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <87sfs5squm.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/02/2022 14:24, Kalle Valo wrote:
> Josh Boyer <jwboyer@kernel.org> writes:
> 
>> On Wed, Feb 23, 2022 at 2:53 PM Christian Lamparter <chunkeey@gmail.com> wrote:
>>>
>>> syncs linux-firmware.git with the latest releases from Kalle Valo (QCA):
>>> <https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0>
>>>
>>> Includes the following changes:
>>> 93591ce ath10k-firmware: QCA4019 hw1.0: Add ZTE MF286D specific BDFs
>>> [...]
>>> f305604 ath10k-firmware: QCA4019 hw1.0: Update OpenMesh A62 specific BDFs
>>>
>>> Cc: Kalle Valo <kvalo@qca.qualcomm.com>
>>> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
>>
>> Forgive me, but I have to ask.  Kalle, is there a reason you aren't
>> sending these or including a Signed-off-by?
> 
> I have not sent any new pull requests to linux-firmware while we are
> trying to sort out the notice.txt problem discussed in the other thread:
> 
> https://lore.kernel.org/all/CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com/
> 
> My plan was to send ath10k and ath11k updates once we find a solution
> for the notice files. I'm guessing Christian wanted to get these board
> files to linux-firmware quickly and decided to submit them directly, I
> was not involved with that at all.
> 
Thank you for telling me about the notice.txt issue. No, I wasn't aware
of that happening.

My reason for creating the patches is that OpenWrt (www.openwrt.org)
is moving forward with the next 22.xx release. OpenWrt pulls firmware
and boarddata mostly from linux-firmware.git - so having those
up-to-date in time for the upcoming release is all around a "good thing".

(OpenWrt uses the monthly linux-firmware.git releases, so there's an
extra delay to account for.)

The current situation is: OpenWrt has those board files (as ~40 separate
files) all lined up in:
<https://github.com/openwrt/openwrt/tree/master/package/firmware/ipq-wifi>
Once the board-2.bin in linux-firmware.git is updated and a new release is
made, those files can simply be deleted.)

Cheers,
Christian
