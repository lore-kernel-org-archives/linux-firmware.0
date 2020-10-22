Return-Path: <kvalo@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6726DC4363A
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Oct 2020 18:26:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B01324640; Thu, 22 Oct 2020 18:26:34 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id B7C7DC433FE; Thu, 22 Oct 2020 18:26:33 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 27381C433C9;
	Thu, 22 Oct 2020 18:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27381C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>
Cc: "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>,  "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: Re: [PULL] ath10k & ath11k firmware 20201022
References: <BYAPR02MB4567892AD5957F360C01E73F921D0@BYAPR02MB4567.namprd02.prod.outlook.com>
Date: Thu, 22 Oct 2020 21:26:30 +0300
In-Reply-To: <BYAPR02MB4567892AD5957F360C01E73F921D0@BYAPR02MB4567.namprd02.prod.outlook.com>
	(Kalle Valo's message of "Thu, 22 Oct 2020 08:23:01 +0000")
Message-ID: <87sga65d7t.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Hi linux-firmware maintainers,
>
> here's a pull request for ath10k and ath11k drivers. For ath10k there
> is a firmware for new hardware QCA6174 hw3.0 SDIO. For ath11k there
> are firmwares for new hardware IPQ8074 hw2.0, IPQ6018 hw1.0 and
> QCA6390 hw2.0. And also few updates for existing hardware.
>
> I did not include QCA9377 SDIO firmware as I saw Christian submitted a
> patch adding that.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit 58d41d0facca2478d3e45f6321224361519aee96:
>
>   ice: Add comms package file for Intel E800 series driver (2020-10-05 08:09:03 -0400)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20201022

I noticed that ath11k Notice.txt files are not valid utf-8. Please drop
this pull request, I'll send a fixed one tomorrow.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
