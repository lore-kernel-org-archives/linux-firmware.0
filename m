Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A12AC433F5
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Jun 2022 06:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6150EC385A5; Wed,  1 Jun 2022 06:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17349C385B8;
	Wed,  1 Jun 2022 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654065875;
	bh=N3F+OXVq3Yhd/7Eme7t9kj59sUbWEwsxF2ZOrdOStTQ=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=uuYzfkKWYg/SxWBZw1qE92ktLf5qurc7vlkGMqU6ypRpDxxjPy8PPcbVhOKkS3+dp
	 wgYxqxodrG0H8laP1IngXj7J5MWZqD2ayn2Gwh/hjKEFFVw9DBexel4jlImFoXbp+b
	 8o2HBdVe3Xhv3LZHFJ+tqK6T3VrwCkfxDDR22kr7kDGs5qKYSZgeO4/U6un1NrN8g9
	 I+D1LSS48IWDy18B8HwDLlmLTaP9IpC3hgu+bJVCqfPWzNBDaBpDqANEYw97xUt7N3
	 E6w1eLKgCZUK7olqL2sP4bzxTKz1WMzLhp5Lmf4DpclaSG/YDx+EFWT0wmuPVjKdaw
	 GznDXxRYQaxBg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>,  "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
	<332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org>
	<87k0b8fnpj.fsf@kernel.org>
	<CAA8EJpr3Uxa-Tif5TyHfXL03j1--vrAb+DgT=0DY8KDpvHPjeQ@mail.gmail.com>
Date: Wed, 01 Jun 2022 09:44:29 +0300
In-Reply-To: <CAA8EJpr3Uxa-Tif5TyHfXL03j1--vrAb+DgT=0DY8KDpvHPjeQ@mail.gmail.com>
	(Dmitry Baryshkov's message of "Fri, 29 Apr 2022 09:12:28 +0300")
Message-ID: <87r148opbm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Fri, 29 Apr 2022 at 08:44, Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > Hi Kalle,
>> >
>> > On 27/04/2022 11:32, Kalle Valo wrote:
>> >> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
>> >> there are several updates to existing firmwares and board files for both ath10k
>> >> and ath11k.
>> >>
>> >> Please let me know if there are any problems.
>> >
>> > I noticed that this pull request doesn't include the board file for
>> > WCN3990. Is there any issue with it that we can solve on our side?
>>
>> Oh, sorry about that. I guess this is just a bug in my scripts, I'll
>> include the wcn3990 board file in the next pull request.
>
> Thank you! No problem, it was more of a question if we missed something.

It was pulled now:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=86f0c5642c4c06583fccce8e03ca400300330cba

Do let me know if there's anything missing or wrong.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
