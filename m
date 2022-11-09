Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D1C433FE
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Nov 2022 17:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE06AC4347C; Wed,  9 Nov 2022 17:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D36C433B5;
	Wed,  9 Nov 2022 17:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668015742;
	bh=0o2wycf0GPL4aGI63TbKvV2zc2G+9FSPyyd0sa9vLF4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dkLtoLAc16ISTd9pM7RjT4xyJDq334MwqGJnpMorHwZ/AZ0mHOlkQHytKnKfL+GKC
	 defzkw+5zB5YkBSmautcGR7AAThUGEGsGtq29M2ZHglwz9D4bLu2ZgQ7OqDL0C4noL
	 bMSJ3HSkZ3lfz/9Ii6vbL+k2kOIHpZ0J9tEY7SsZjgkHlwL5x81GI879jFXP0DlaTC
	 Xk3jvJ2iUWouqxCRJbatA1/0YWZyRJryfWfeFr3NufqCpE2PiYMX/QS/bmWOYZIIHD
	 2VeLeyNJQ348PUfIAFd4t8CYte9DiOIRL5jQHu9r9PTAyTqNLMEyhF/wcLHMC1ED9h
	 AYym/1HiN9fsQ==
Received: by mail-ot1-f43.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so10518050otl.3;
        Wed, 09 Nov 2022 09:42:22 -0800 (PST)
X-Gm-Message-State: ACrzQf21cMZEmR2HEzC8jZ5zC1WAOxX5y78PjTmVd5esq7J+ewA0yM2P
	VJhMylbzD6/HZFRd0M1Ysp5QyvRkj5Kj2wHd6yQ=
X-Google-Smtp-Source: AMsMyM5l5ceHkA1mP/vIxELodyH1zp1Q4we/1YmrmgyF06KKDC7c/Q5EQ9RxQSeY/V7o7CfgeAqlRy5BzVj29pSy1tk=
X-Received: by 2002:a05:6830:6089:b0:660:ea3e:46b7 with SMTP id
 by9-20020a056830608900b00660ea3e46b7mr30168045otb.166.1668015741825; Wed, 09
 Nov 2022 09:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20221031184303.113448-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221031184303.113448-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Nov 2022 12:42:11 -0500
X-Gmail-Original-Message-ID: <CA+5PVA78nzFYt9n1FywS9Xz6k_ShRuqRssMC-GVA8t=UjycnKA@mail.gmail.com>
Message-ID: <CA+5PVA78nzFYt9n1FywS9Xz6k_ShRuqRssMC-GVA8t=UjycnKA@mail.gmail.com>
Subject: Re: [PULL] qcom: replace the rest of Venus firmware with MBN files
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 31, 2022 at 2:43 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Follow the example of vpu-2.0 and venus-5.4 and drop the split venus.mdt/.bNN
> files in favour of venus.mbn files. Provide compatibility venus.mdt ->
> venus.mbn symlinks.
>
> The following changes since commit 8bb75626e9dd831d323c4e460414b56260f0b700:
>
>   Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2022-10-31 11:12:54 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware venus
>
> for you to fetch changes up to 7d5671369d1c8f2d4125ff931602f2f8fe20211a:
>
>   qcom/vpu-1.0: drop split firmware in favour of the mbn file (2022-10-31 21:32:05 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (4):
>       qcom/venus-1.8: replace split firmware with the mbn file
>       qcom/venus-4.2: replace split firmware with the mbn file
>       qcom/venus-4.2: drop split firmware in favour of the mbn file
>       qcom/vpu-1.0: drop split firmware in favour of the mbn file

Pulled and pushed out.

josh

>
>  WHENCE                                  |  37 ++++++--------------------------
>  qcom/venus-1.8/venus.b00                | Bin 212 -> 0 bytes
>  qcom/venus-1.8/venus.b01                | Bin 6600 -> 0 bytes
>  qcom/venus-1.8/venus.b03                | Bin 5568 -> 0 bytes
>  qcom/venus-1.8/venus.b04                |   1 -
>  qcom/venus-1.8/{venus.b02 => venus.mbn} | Bin 975088 -> 992976 bytes
>  qcom/venus-1.8/venus.mdt                | Bin 6812 -> 0 bytes
>  qcom/venus-4.2/venus.b00                | Bin 212 -> 0 bytes
>  qcom/venus-4.2/venus.b01                | Bin 6600 -> 0 bytes
>  qcom/venus-4.2/venus.b03                | Bin 28976 -> 0 bytes
>  qcom/venus-4.2/venus.b04                |   1 -
>  qcom/venus-4.2/{venus.b02 => venus.mbn} | Bin 884136 -> 925432 bytes
>  qcom/venus-4.2/venus.mdt                | Bin 6812 -> 0 bytes
>  qcom/venus-5.2/venus.b00                | Bin 212 -> 0 bytes
>  qcom/venus-5.2/venus.b01                | Bin 6600 -> 0 bytes
>  qcom/venus-5.2/venus.b02                | Bin 837304 -> 0 bytes
>  qcom/venus-5.2/venus.b03                | Bin 33640 -> 0 bytes
>  qcom/venus-5.2/venus.b04                |   1 -
>  qcom/venus-5.2/venus.mdt                | Bin 6812 -> 0 bytes
>  qcom/vpu-1.0/venus.b00                  | Bin 692 -> 0 bytes
>  qcom/vpu-1.0/venus.b01                  | Bin 7528 -> 0 bytes
>  qcom/vpu-1.0/venus.b02                  | Bin 300 -> 0 bytes
>  qcom/vpu-1.0/venus.b03                  | Bin 20 -> 0 bytes
>  qcom/vpu-1.0/venus.b04                  | Bin 20 -> 0 bytes
>  qcom/vpu-1.0/venus.b05                  | Bin 20 -> 0 bytes
>  qcom/vpu-1.0/venus.b06                  | Bin 20 -> 0 bytes
>  qcom/vpu-1.0/venus.b07                  | Bin 24 -> 0 bytes
>  qcom/vpu-1.0/venus.b08                  | Bin 16 -> 0 bytes
>  qcom/vpu-1.0/venus.b09                  | Bin 883152 -> 0 bytes
>  qcom/vpu-1.0/venus.b10                  | Bin 41360 -> 0 bytes
>  qcom/vpu-1.0/venus.b19                  |   1 -
>  qcom/vpu-1.0/venus.mdt                  | Bin 8220 -> 0 bytes
>  32 files changed, 6 insertions(+), 35 deletions(-)
>  delete mode 100644 qcom/venus-1.8/venus.b00
>  delete mode 100644 qcom/venus-1.8/venus.b01
>  delete mode 100644 qcom/venus-1.8/venus.b03
>  delete mode 100644 qcom/venus-1.8/venus.b04
>  rename qcom/venus-1.8/{venus.b02 => venus.mbn} (98%)
>  delete mode 100644 qcom/venus-1.8/venus.mdt
>  delete mode 100644 qcom/venus-4.2/venus.b00
>  delete mode 100644 qcom/venus-4.2/venus.b01
>  delete mode 100644 qcom/venus-4.2/venus.b03
>  delete mode 100644 qcom/venus-4.2/venus.b04
>  rename qcom/venus-4.2/{venus.b02 => venus.mbn} (95%)
>  delete mode 100644 qcom/venus-4.2/venus.mdt
>  delete mode 100644 qcom/venus-5.2/venus.b00
>  delete mode 100644 qcom/venus-5.2/venus.b01
>  delete mode 100644 qcom/venus-5.2/venus.b02
>  delete mode 100644 qcom/venus-5.2/venus.b03
>  delete mode 100644 qcom/venus-5.2/venus.b04
>  delete mode 100644 qcom/venus-5.2/venus.mdt
>  delete mode 100644 qcom/vpu-1.0/venus.b00
>  delete mode 100644 qcom/vpu-1.0/venus.b01
>  delete mode 100644 qcom/vpu-1.0/venus.b02
>  delete mode 100644 qcom/vpu-1.0/venus.b03
>  delete mode 100644 qcom/vpu-1.0/venus.b04
>  delete mode 100644 qcom/vpu-1.0/venus.b05
>  delete mode 100644 qcom/vpu-1.0/venus.b06
>  delete mode 100644 qcom/vpu-1.0/venus.b07
>  delete mode 100644 qcom/vpu-1.0/venus.b08
>  delete mode 100644 qcom/vpu-1.0/venus.b09
>  delete mode 100644 qcom/vpu-1.0/venus.b10
>  delete mode 100644 qcom/vpu-1.0/venus.b19
>  delete mode 100644 qcom/vpu-1.0/venus.mdt
