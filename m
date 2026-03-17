Return-Path: <SRS0=GzNg=BR=gmail.com=jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD80FD8740
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Mar 2026 11:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82945C19425; Tue, 17 Mar 2026 11:34:53 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4EAEC4CEF7
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 11:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4EAEC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso911532d50.0
        for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 04:34:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773747292; cv=none;
        d=google.com; s=arc-20240605;
        b=WatjwWDGHTg61nyrg4+hIAe7u7Cw+Uhu8uvmJ81Hgx/qgjwlkpH7LePoQUN66EjqHk
         S7okS2T3V95ddcQrzp9N97OxhknsnfRRSuyc1SLoCeoECdvxqAROy76RwgDtJGqy23Oq
         mbBvwvP8kiPmmACfs+3qfcCRTGhTMYECW8djLhYpEaVYV/e+fL/7+thoRWexFlxZt6/L
         DtHNTZ1IAUp23A269ZVaZeOmCvO2nwgff2BL6Luqe4kL9NteTVWulpmB3rop2H2nNpuv
         8+NlDJiMfeUyJUJlWCPVb6EXYnfblUNcRh2jLfJnduBiX4B2soPafWbEskAhqfwJqQvw
         TjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2o6u0cp5eF2mnNMycUc9Yt9LAmqd9LPFAkSt83435Ys=;
        fh=ZoZENHe4MMGsUVoJshTEILtyrTRfitAezT0MOKYMLuA=;
        b=ABMAUnX6hKR8/u1Abi51BJDTqG+CkCccoMwbFJx9sMoGqPeEv/EZcyPsaHm6EdPaml
         AT9ak9RwwL3CkTaNKDOYdg/EUpKgRRxvYTO9O8wrKTW7dpfpc23nEtH1W4DkTR+JiioQ
         l+sN23L4C29G+nYhsV8H2LxOf2ZNmhNFFuyAiqUx2I/fHvKwj8S5r8KDB1cnAILfw9cK
         cJYYyoKPMjrYVMF/p80cSUlVUj1HboEK4r+6KJRG8LF99iVmZ/WpMUE7CF2KiuyAAQpT
         ltv1txQpKumXTK3wGA7a/SGxnu8xBjUHlU6yZFU1M0x2k5cpv8jcOb37jKdEXtBcDxFt
         i4mw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773747292; x=1774352092; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2o6u0cp5eF2mnNMycUc9Yt9LAmqd9LPFAkSt83435Ys=;
        b=X2ZxmIXl10W9+1mndBNscZhHZt8NfaXCyyqSkQfC6MFOJiUy4g+VbrseuNZnKsL+tG
         PzQN9z7aaKscTdl9VT6tNXHkCX1mCS3gDK95PzQqLnklbwuZSy1YDKJp+PPERtH5AFY1
         P0tCbKSd/LYEqdRynh8P4SdHuD1pRiUCGl6jCd1Q3Y9ic0myX3UhCyxgVarDuydUVd43
         /96/J6LYEmQkhGMaRHGxAmFrtjt4WWXjnMsLO/iSl7xP4OMtwZFCrGB+DsvmUoIFHqBb
         r+0oHRynUjYZTuFXjWhhC3C2N2DK7jVN4UfvnoT185wB8nhP/Gv6YSyOS5BY+AnlWdma
         MiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773747292; x=1774352092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2o6u0cp5eF2mnNMycUc9Yt9LAmqd9LPFAkSt83435Ys=;
        b=d4WFpRX5VVPkzq2lqpBKXtFpm44b8p7oZSlG2MWQK7RY3AtaBwVuxjhZJyWkZHWtVX
         jst1iP83UHNPdZA9QNVKoA48gls61b2ZUTmLs6T1JluxzJUJ413qbZw9dRORHg3/zplA
         q+bFHIOY1e+Gsjx+mdx7zlLQBnGqKC/ux5KvyAtRH3xfveY/OY1pSNV4bG/BoxhMEfQh
         fH347OxrhOqwq3zUI/oxrwVXZlTTFtsvt5ARwD/NUnbSFO/SZ54r8+N42MQmZlG2aQll
         D9Tv7cmzsviDj6KjXLxjO2jZFzMG9YXOkrsq4LHq6I9FuXAMo/Hkp2G+BQspXMeVYVxQ
         Z3qg==
X-Gm-Message-State: AOJu0YyiqyD+sp/Nmr6mAoPLqfLAVi+mTkD6micF++vVirvkyLyDpNJW
	yMvYJ84PTDL0uIdZCnAzPXjkpTtuaJg+DDDhshUhX/PHhjlhKhjs6xpZsd1LZpnwxcc4zQkGIZc
	bKuarJEFunVZMYMmHg5qoO6I4mduh4LtPCEGd
X-Gm-Gg: ATEYQzxJxI+Q107t0uJ3CdPb+tChuf2irCWJUEAKvyRnw4ujzIvxB1D2IPRzJOpfcHR
	h9Dvi1pRwzhM3F685ayu1FTtbDPjW73MyzpoC1J69oE0utv8Fa7RuwFT6FZrYbHU4u6FhB4gavX
	k2na8nbU/8w6VCVYOoJ6fsREQMzw7DhCb6YUVDLBbLaBp3QWMfaTHAvLLHt3aKfgwAG80pawI+5
	TbZm/hDnc6R7Y/g7oa538BLzI1lLg4hKPKQZhdX2ApZlNdu1ETHbAopq7QQEQgSrMndlSbQLKlJ
	2jbfsiE=
X-Received: by 2002:a05:690e:1aa2:b0:64c:9ac2:2cde with SMTP id
 956f58d0204a3-64e88a45c67mr1818726d50.17.1773747291749; Tue, 17 Mar 2026
 04:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <755cee99-cc74-46b1-bc92-4ca9cb122107@oss.qualcomm.com>
In-Reply-To: <755cee99-cc74-46b1-bc92-4ca9cb122107@oss.qualcomm.com>
From: Josh Boyer <jwboyer@gmail.com>
Date: Tue, 17 Mar 2026 07:34:40 -0400
X-Gm-Features: AaiRm53k8vCRNL8spTOB-ahkNWIiZA4xOxzca-hTA8kOvYC5_Rat7HotHALui-8
Message-ID: <CA+5PVA7tx1gkoVF-9XShbgkJTeTBojL7eRbdzbJHaEj=PjKXMw@mail.gmail.com>
Subject: Re: qcom: add QUPv3 firmware for QCS615 platform
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 10:39=E2=80=AFAM Viken Dadhaniya
<viken.dadhaniya@oss.qualcomm.com> wrote:
>
> The following changes since commit c822cbbb14ce5b8ee1f27346220640ac350bbf=
34:
>
>   Merge branch 'mt7922' into 'main' (2026-03-09 20:00:12 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git qupv3-fw=
-qcs615

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/954

josh

>
> for you to fetch changes up to 348a4f2eac666c33ee9c853b6610a860b48fd9b5:
>
>   qcom: add QUPv3 firmware for QCS615 platform (2026-03-10 20:01:32 +0530=
)
>
> ----------------------------------------------------------------
> Viken Dadhaniya (1):
>       qcom: add QUPv3 firmware for QCS615 platform
>
>  WHENCE                  |   1 +
>  qcom/qcs615/qupv3fw.elf | Bin 0 -> 49235 bytes
>  2 files changed, 1 insertion(+)
>  create mode 100644 qcom/qcs615/qupv3fw.elf
