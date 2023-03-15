Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84D9C61DA4
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Mar 2023 06:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97904C433EF; Wed, 15 Mar 2023 06:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C76C433D2;
	Wed, 15 Mar 2023 06:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678861701;
	bh=Kxs1ixjde/xHKf3SionGwNBkPkmhkANdt5+Lb0JzJW8=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=X6BGftaSM3bY5uVUB7ZZXkFshEvhxvNEgK8S1tQaB+2CVXCT+YYRt2u9w2YcxoBud
	 tAbXe/GOSQ76irbkr92Kd+v8SY1BJ0oVf2PUO8g6rbB8TI6SokqlkmIn4/gXyDBiP4
	 A6c+u36bFE0nlGxDgda+K0OVV8kE3HSeSRLIFvn01V3Y/FITEKcOTZAUZ9MY/XKn2y
	 rjLvDheZcnAkAznyRivI6rcBYz5KwnH8FHdmLrF4yGWE8C1DTNT/v4onvlgmc9AUY9
	 Sp0EJzLc+fLQecMcL30Vf+mQ+vLLKlNwUvn9TOP4Rj+yHdWZkA2Pf1yov6G1Jy+5A4
	 0NzWtvK90o1Ew==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,  linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
References: <878rgzuw37.fsf@kernel.org>
	<c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com>
	<87a618517g.fsf@kernel.org>
	<97b7f35c-f7c9-1257-ff67-e5b61efe0ce0@gmail.com>
Date: Wed, 15 Mar 2023 08:28:17 +0200
In-Reply-To: <97b7f35c-f7c9-1257-ff67-e5b61efe0ce0@gmail.com> (Christian
	Lamparter's message of "Tue, 14 Mar 2023 13:59:47 +0100")
Message-ID: <874jqmo7em.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Christian Lamparter <chunkeey@gmail.com> writes:

> On 2/20/23 06:56, Kalle Valo wrote:
>> Christian Lamparter <chunkeey@gmail.com> writes:
>>
>>> On 2/15/23 10:17, Kalle Valo wrote:
>>>> Here's a new pull request for ath10k and ath11k. We have new hardware
>>>> IPQ5018 and various updates for existing hardware. Especially many have
>>>> requested the firmware update for WCN6855 which seems to fix an
>>>> important suspend problem.
>>>>
>>>> Please let me know if there are any problems.
>>>
>>> Could you also please include all the QCA9888+IPQ4019 boardfiles updates
>>> from last year too?
>>
>> I will try to go through them later. The problem here is that I don't
>> have much time for ath10k nowadays.
>
> Ok, should I just post the board-2.bin updates to linux-firmware?
> I have them ready to go for IPQ4019, QCA9888 and QCA9984.

But is the problem that then I don't know which one you picked up and
which one you skipped? Thanks for the offer but I think it's simpler
that I'll pick the board files instead like before. I put this now to
top of my todo list so shouldn't take long.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
