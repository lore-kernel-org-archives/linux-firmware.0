Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78538C47DA9
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Jan 2024 18:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42A95C43390; Tue, 30 Jan 2024 18:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06875C433C7;
	Tue, 30 Jan 2024 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706637697;
	bh=KoSlChzPbN1luVkVxR15iprRA73XaF1uhQs4tygUHo4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=YKgD9gZrix7B29e7sUr7A89+zy51SzBYHIQY3aGJLuq0jIuYhOue2S0INyeboX4Kz
	 waRLsPMYt5QGPNgx6uHeWXN7+qzxw8wJqWHrefe+RRZIMSWF3vp7RwiNQhg17/49y4
	 VV5ZpCXaJWIi0ItHytXHEJyPX/PLQTTlTkjol5zkViwaN9eVC75sJYXdXjlbpc28pZ
	 jEN00STfIbOGJUhjrdlrXP+BOAkvbqoNoHpmTHIA3ge3tVJr0bYoZqGfyc9mRyVG+x
	 BK0/isf43HfzD2ssNcv1bdrDl35RsR7lfhBaqP3CMIHXrRFKIBp/zYzgGikNo4ZLH/
	 zmX+cjd3qyU6Q==
From: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware 20240130
Date: Tue, 30 Jan 2024 20:01:34 +0200
Message-ID: <8734uewvi9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Hi,

We have one important update for ath11k WCN6855 which fixes a suspend
regression reported by several people.

Please let me know if there are any problems.

Kalle

The following changes since commit 1a9518c73c4b54854c9cd8f416fd3b8f8e3456e7:

  Merge branch 'mlimonci/amd-2024-01-30.2' into 'main' (2024-01-30 15:55:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20240130

for you to fetch changes up to 5217b76bed90ae86d5f3fe9a5f4e2301868cdd02:

  ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37 (2024-01-30 19:58:18 +0200)

----------------------------------------------------------------
Kalle Valo (1):
      ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

 WHENCE                        |   2 +-
 ath11k/WCN6855/hw2.0/amss.bin | Bin 4988928 -> 4988928 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
