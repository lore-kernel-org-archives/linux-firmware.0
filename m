Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B38C05027
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Feb 2023 05:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54C6DC433D2; Mon, 20 Feb 2023 05:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7F3C433EF;
	Mon, 20 Feb 2023 05:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676872620;
	bh=5JHwltP1Ty2yMplq2EVAhu35AZV7ddBYuUNTdJtolw4=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=XnKb1INAqRS3T4OM0rYjjF8UO+uGNd5E6gJePYFa9xqrKkPPzvc9sxWXib0avdlXz
	 edixFX4HnH1/EIcLjK2lqUBu/AjXvUTsLMYIEsFqfmy+v44pPLX8kxqIXUtsFOhlke
	 QJaJ8udOaWtJB/oe6hVCMFnNBcxacq85PiRimDAlYSdJrAUJdbBnKE18dhwPfENyYM
	 9cGvynMPZlO2Jtc0qA7+f4/+ELgVbv9/59dUAazWzjSamwu/uQcqgKYn+ojg1YTRhy
	 gJwJ/NWEz/gL3uzHuc5OufYdP9MRhZ8topK8x+dZXKOZc3GSKTWqalsnFfyeqTDSX+
	 Z+zJaksxgIfVA==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,  linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org,  ath11k@lists.infradead.org
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
References: <878rgzuw37.fsf@kernel.org>
	<c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com>
Date: Mon, 20 Feb 2023 07:56:51 +0200
In-Reply-To: <c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com> (Christian
	Lamparter's message of "Fri, 17 Feb 2023 19:57:03 +0100")
Message-ID: <87a618517g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Christian Lamparter <chunkeey@gmail.com> writes:

> On 2/15/23 10:17, Kalle Valo wrote:
>> Here's a new pull request for ath10k and ath11k. We have new hardware
>> IPQ5018 and various updates for existing hardware. Especially many have
>> requested the firmware update for WCN6855 which seems to fix an
>> important suspend problem.
>>
>> Please let me know if there are any problems.
>
> Could you also please include all the QCA9888+IPQ4019 boardfiles updates
> from last year too?

I will try to go through them later. The problem here is that I don't
have much time for ath10k nowadays.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
