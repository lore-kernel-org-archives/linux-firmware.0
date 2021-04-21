Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD714C433B4
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Apr 2021 11:20:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6509461439; Wed, 21 Apr 2021 11:20:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E5B561448
	for <linux-firmware@kernel.org>; Wed, 21 Apr 2021 11:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619004012;
	bh=DRMcyeuA5wA5FREh/k/DxdRqF8OdBIsX5HEzCNIqts4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=N8iN5nAgB7W+lOFD++VCVHz937A6/T7OFxEsw9UuK/e5AW9LNNNHlBiMaWmLyz/oP
	 5N9uXX53LiBAfruIc6vQ0sr87CYAMlKGZvvjxalAPKikr9YlRtg0SO7b8LWQy8F28P
	 KQNK+hU+uR5dVhTCzzMWLqH658/T9oMG6EmEdtJaH6XTPUJriTCXv5qEEBcCcrrF/0
	 rLCfUqZKvg/1cqq8UpwzncMjHHGTwt6pNpGG4Actapjg64HVssLVxglmQ3W2LwNcYa
	 eAfdulbHIE20iFWo4mhlwoA2FUd2rrHZM5V3U7Z4bZ0QA8GNnPLQvPJQlh9DTKewUr
	 3ptk5oNlDZ8og==
Received: by mail-il1-f171.google.com with SMTP id l9so6167982ilh.10
        for <linux-firmware@kernel.org>; Wed, 21 Apr 2021 04:20:12 -0700 (PDT)
X-Gm-Message-State: AOAM53277hPhlsrma3X0tHzmNbc1OEiKKMO0vT55q8vyQ2YIwZ8JAiff
	yOEAIVE1TxKnOFAOYqeSWfMGPM/kUaL2FW7yObQ=
X-Google-Smtp-Source: ABdhPJz2yR3srj63bxKy1z41T6I6nZSdTcPhNOSrFF7HLaH5HW8rf7jBzKZrNo14StSUQMtMex4plsYFh1bgrqyDM7E=
X-Received: by 2002:a05:6e02:160d:: with SMTP id t13mr26534078ilu.85.1619004011565;
 Wed, 21 Apr 2021 04:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <f90802a86e80b6d9cc96ea8dd6aef4d8@codeaurora.org>
In-Reply-To: <f90802a86e80b6d9cc96ea8dd6aef4d8@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 21 Apr 2021 07:20:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4wcjrNvBKabAW9BDDLKtZsjHRbyAYG+bqv8sMOu7gr-Q@mail.gmail.com>
Message-ID: <CA+5PVA4wcjrNvBKabAW9BDDLKtZsjHRbyAYG+bqv8sMOu7gr-Q@mail.gmail.com>
Subject: Re: Request to update venus-5.4 FW files
To: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media-owner@vger.kernel.org, 
	vgarodia@codeaurora.org, dikshita@codeaurora.org, pbadge@codeaurora.org, 
	adhudase@codeaurora.org, sampnimm@codeaurora.org, c_mansur@codeaurora.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 21, 2021 at 1:58 AM <smagar@codeaurora.org> wrote:
>
> Hello Team,
>
> Please include updated firmware bins for venus-5.4.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
>
> The following changes since commit
> 85286184d9df1b03bb76049edcfd87c39ce46e94:
>
>    Merge branch 'for-upstream' of
> git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19
> 11:34:11 -0400)
>
> are available in the git repository at:
>
>    https://github.com/suraj714/linux-firmware-venus.git master
>
> for you to fetch changes up to 5c893c65b862906a627cea238ae8c2d099027dee:
>
>    Updated Venus firmware files for v5.10 (2021-04-20 11:48:28 +0530)
>
> ----------------------------------------------------------------
> smagar (1):
>        Updated Venus firmware files for v5.10
>
>   qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>   qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>   qcom/venus-5.4/venus.b02 | Bin 873680 -> 873596 bytes
>   qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>   qcom/venus-5.4/venus.mbn | Bin 919792 -> 919708 bytes
>   qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>   6 files changed, 0 insertions(+), 0 deletions(-)

This commit looks reasonable, but it's in the same tree and branch as
the other weird PR I just replied to.  I'm going to wait for a bit on
this one.

josh
