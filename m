Return-Path: <johan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCE6EB8FAF
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 11:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8A5FC433C9; Wed,  6 Sep 2023 11:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB066C433C8;
	Wed,  6 Sep 2023 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693998390;
	bh=D38m9GvqEAKfaUtM6EZEV3uzpRT9zqOWh0ZSBhKUkbM=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=oHHChaL8hpCfkv/IU6LdjUNjm3BA3Zm/Fr0RHIeoYNvcUE/e/DVHJktp+D3iYNpat
	 ecz03SdWM/lT8uRuaGiRdph68mNiH1r+cTw5gUEYi7WldfHuO5MhWw3fq8ZE4AwRZ/
	 Sw11Nza63Texz+GXBtI/6lRL+JDvInAceXDzQq1Sl8W9Yv+BeINde+WibheysrOu+z
	 SPgSDnUVG/F6jJ/QC6DZXPEG1gUx2uh6bG9+pg82Gz0/c0cKDccOBI73/2SB+6sEiv
	 3414rF9jw+MedPFwxwxV9Qn4NwnJY20E1eNx8rnMSJjD31+y6H1UREHDiMZkdfclKa
	 UqhXP8C6RLlbw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qdqN5-0001pj-2c;
	Wed, 06 Sep 2023 13:06:56 +0200
Date: Wed, 6 Sep 2023 13:06:55 +0200
From: Johan Hovold <johan@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-firmware@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Add soft link for Audio topology firmware for
 SC8280XP X13s platform
Message-ID: <ZPhdT9gr1AUt0Gxq@hovoldconsulting.com>
References: <cd373622-9c44-4fe4-011a-73e879e8667a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd373622-9c44-4fe4-011a-73e879e8667a@linaro.org>

Hi Srini (and linux-firmware),

I was going to send a reminder about this not having been merged yet,
but it appears you managed to screw up the recipient list somehow so
that it was never even sent to linux-firmware@kernel.org:

	https://lore.kernel.org/all/cd373622-9c44-4fe4-011a-73e879e8667a@linaro.org/

As this is needed for audio on the Lenovo ThinkPad X13s, can we try to
get this merged as soon as possible, please.

Not sure if you need to resend the pull request or if the above (and
below) will suffice.

On Mon, Jul 24, 2023 at 02:11:16PM +0100, Srinivas Kandagatla wrote:
> The following changes since commit c7824580d310809b55f95626b4b46954911be820:
> 
>    Merge branch 'v2.0.21961' of 
> https://github.com/yunfei-mtk/linux_fw_10bit (2023-07-24 08:30:51 -0400)
> 
> are available in the Git repository at:
> 
>  
> https://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git 
> sc8280xp-audio-fw-fixes
> 
> for you to fetch changes up to a8b2a94c58f5cd9dc93b56dbdce83c867ea1e916:
> 
>    linux-firmware: add link to sc8280xp audioreach firmware (2023-07-24 
> 14:05:12 +0100)
> 
> ----------------------------------------------------------------
> Srinivas Kandagatla (1):
>        linux-firmware: add link to sc8280xp audioreach firmware
> 
>   WHENCE | 1 +
>   1 file changed, 1 insertion(+)

Johan
