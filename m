Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA63C433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 29 Apr 2022 05:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98B4CC385AF; Fri, 29 Apr 2022 05:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496CFC385A7;
	Fri, 29 Apr 2022 05:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651211069;
	bh=RgOWZfYnD1p3E6QBrmMNLzNcgmp0EowJzG0gJaNZlH8=;
	h=From:To:List-Id:Cc:Subject:In-Reply-To:References:Date:From;
	b=jymF01sN7zHO8P9154EGfmnwVsjVHOwoQ1gRIu3nY1JIOu3P8EBa1rAMlZMNbXLG+
	 B1cxbVId1IiRwvZ1YiKvfU+Tga5cgeXXlBGsCj6f5FrAZfq6PWJRyx0da1gh9znzvi
	 XpZj+jPAmOaQnAjaaw18ibkyIg3riH+vM8SJ9FKsIO71lXJIXwH0Ck/wcrYgemNE77
	 CHlpaLxuwInPuSA5WHyKVR+PFdJBmvzvZsT7CghrFl8K+eUeMWVc9akwKv+VUtmrje
	 9tRVSb+cLknS/NsrG+d2ncvwqIGz3YmV3I7JNZrsQI0Elx64mgDsnvRB37snan2RGe
	 MkVAGq/x/NNew==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>,  "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
In-Reply-To: <332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org> (Dmitry
	Baryshkov's message of "Fri, 29 Apr 2022 02:43:38 +0300")
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
	<332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Fri, 29 Apr 2022 08:44:24 +0300
Message-ID: <87k0b8fnpj.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hi Kalle,
>
> On 27/04/2022 11:32, Kalle Valo wrote:
>> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
>> there are several updates to existing firmwares and board files for both ath10k
>> and ath11k.
>>
>> Please let me know if there are any problems.
>
> I noticed that this pull request doesn't include the board file for
> WCN3990. Is there any issue with it that we can solve on our side?

Oh, sorry about that. I guess this is just a bug in my scripts, I'll
include the wcn3990 board file in the next pull request.

Linux firmware maintainers, please pull this anyway. I'll submit a
follow up pull request later.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
