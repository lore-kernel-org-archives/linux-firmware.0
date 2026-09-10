Return-Path: <SRS0=L/2Y=HC=gmail.com=jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451EAC79FB9
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Sep 2026 11:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 055001F00898; Thu, 10 Sep 2026 11:12:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.140
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1789038746;
	b=yKd8zvy0btlaEf0aOeLE85pgcYV2+UATEeHla5TRds6XWq7zF9VmR3n0p/boqjAfk/dJ
	 WXyzuxfaD875O0o/OyTVfKRbcYDDN+1rfyWEMEdISgnRlLhG/zKo9TQArAWwZaU5QSgPO
	 qEYkbW67AnrlnNAaMXQg1e5sQrjmhdg0foy5EVjSN58euQ2/gjhBwRZerpLyMXQRBgf5e
	 aW/EAcZBEhP22/vTHT2g7mxsws4hsNABuo5CYl3XvWHMiFWv4NDnZ6ciMLvU2gtrWJkOI
	 i90yCEAQ2Dg9N9fJgdxFU74ker6gYFaDnKY5GTn7hnJsIeD/q+OhIToWsNzTgdYOPdw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789038746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=3tFEBvJoYX+41tTvAC1AHUtlwbfX8u3OlEaBUhyanpw=;
	b=n+j/x1Prno6seyqeAcg4jrk+5AC60u70F6jrHYIrwd6tSjxbUHqzBz9Kut2Io2rAimLX
	 LhBApiRyd0JnTKcKHP95Zi9pcY6FHyBCbJEakxFikLLIBpkrMiEG3gY8Dxs/vfkOBuxN+
	 M5CoGTY7kmUovfwW7xbv4/aeTFiC0wJ+aJUhHLYory1RolLiQh6a4Hckap8NetMZRyjM/
	 FeM1YaWsJiyor4zjJt29Um67B6fBIWbOAkHJXIV83gZ/UIwYh7EefUxFnRMXa0u1Vdlxw
	 u+LPvdXBdNr9raIOk8hYEZkzXf6ZqPU9PvAffqAGgfR5HYJoJPRlR0W+zh7FnCbtMPA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HyXAgZXs;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.140
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BED81F000FF
	for <linux-firmware@kernel.org>; Thu, 10 Sep 2026 11:12:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HyXAgZXs
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6BED81F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d46e4cdccso21071407b3.1
        for <linux-firmware@kernel.org>; Thu, 10 Sep 2026 04:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789038745; cv=none;
        d=google.com; s=arc-20260327;
        b=Wbk3KCcNsE3oWhQdvHYb06zRtIG/9m9BKlZnkZeAq5k/0okygDD4HSM6vxb2IUvVQ0
         yo2QDLApWoO/4huYM/Xci6EUsoeNMgYZRNPQKqZHdo7JSzVqCI9yZHsVg7ktxj8dENtV
         AJxW61x4RfG7zHO6g++vXIx46IKsIq7XV8Cq2nwIUnF3Q9+52nE6ZPPL0qhq/18BEb9o
         rtmZfzu7nJpLha6PfpG+Z3q7cdWEa7VyOi8An1OpkxbafkySN8N1Fx6yfHIEQOWjrGvG
         SGDqia3oYzK6pgY0usE+iAQTwvjGYxCzzh2pbAFQ6Ypzb+yfa3bKH/knioRzCA+ICYlE
         1e0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3tFEBvJoYX+41tTvAC1AHUtlwbfX8u3OlEaBUhyanpw=;
        fh=OyIfwckIKD9D5wbWKvDnq+PT7iPkr+blU8EHYHnMLc8=;
        b=kj0DIe+a9Je5ub0M/npUwPuGKbFhTv5RUdZzqHeqg8K0VCd6ykE3KoFzcfnD2WLHUJ
         CUtiTfqQ3CYKL9yICeSmVZ/84x9GBamPmwspFoN/drpRtnynGqn/hr1iHzX6HQSnaedN
         ++Wdh4UkzXZrDMsLj+TecoYHaeI33/k/nafsl3ZWi7zKDHAGD0XDA7Fagy5V9v0p2Yxn
         VSdO0udjoGnbjePSWoukyZ/Awmp3LyH/eAr2DuLoGHqovYd3/C3tLCjsxcsktveDH2Gz
         e2A+VjXVuXgkHMcrFKM5+cWF7U7iuDhwjee/eOMqDLlQSlVbMEnSbQGJOpikLHAeF7Nn
         RDLw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038745; x=1789643545; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3tFEBvJoYX+41tTvAC1AHUtlwbfX8u3OlEaBUhyanpw=;
        b=HyXAgZXsdS4DLRdQOUy1EvJxi6ouYC6+xfiHwmZru4YHIAiFbZw9zdVmppJm2JISg4
         /fhmg6xHROOYaqKeQOknqXanUzM4RPiEmeGRzw6rGytdiQ1/FcikypefK3AFHX4a4cnG
         EmUkFfZbl//Fl9irokw7cAaAmbFNEDAyNcTllsRFJGocAcM3JZExfo9rS3ificHMfNC/
         CblBY3lstE8nGZlusZ33eTXHaH+XedudTS7SWt2jrr8tS1rddFMP7KkmGDmFnFDTytmq
         s6aH7LQUDMfs3ZQJ4Go311sNbkIE41SIcUd7nAdGvjEMNulk1cz/6qZs+6FpmzK1DdeQ
         2fQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038745; x=1789643545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tFEBvJoYX+41tTvAC1AHUtlwbfX8u3OlEaBUhyanpw=;
        b=Co4CT2bkqh4XgXWDlg6cc+Y6W1LCmu5y6V+XU1z6vqAwzleDoGOprsVS8/w01NIMqv
         tLGjPvE2u+AyM8iqUk/ajSH5HWoINVMo3CjTaVj+5Rd2RnV02GuOijC4pG8fkKnRyPSA
         KSQ4z4SOn7xObrjpxwvdYHTiLbtUYKpFnev3GEtSWKDRBelsP3Hu+eimtK0S9cTBGG0O
         sxU4av/FU2mWNh/hyV5600dSMTrZ6IZb7xsW0QwyFeH/KJsthQ+7UBUHoqdW+o8tpWbR
         5ThZ5U7zYHK0Cvu/XHIgsGc7P0cmg4Q67hh8Cr4BodfBQxiGepsRyx8SlBE3isNwprdo
         suCg==
X-Gm-Message-State: AFuF++n4W68DtnynkhOyhkLE1zbyIKW698biGMk8vowk6xbnlQ5yAOxm
	vNgSuGnvb8qDvvbxQiHUCk7ILByoXxtz/GBFf+9dNhL5D6OJfGGyEQGj6jsuDKDaUp0M+Our3qT
	au54SYMwUCVzuCuUMl9T2JZfGgvabRxfwFUih
X-Gm-Gg: AYBFou0KHeb8qfXx6zNDmXvaTEuQQZ+svzCoWE6AYrwQrOO2CkfKwHI2rTn0ZH/4Bew
	zdlM8pqWsF/cy3gNzugEyftwyTkFa5ZnEbdy4PB/Z8TCWdKdV2wzG6cnOOaj0kZhWkAiLAtrzn5
	facAwyCOja+HeAtqL/eS5eKaqyrbC5i/wzoxjcNjqxhdlCXR/sWVZWrimnCaixgc0abU2hSL+Qp
	p6ZSOnw9wt5BD6trfTVMNNOvYTXFJvciiWQQIMmtkI0fvzfVe+6vPOrvydlRmDYUlO8z6GjCZ5d
	xRWNp+dQ5nCsPHLE+DinlZ4IRVzxcm0sUnAi75JO30KEcWzLpWMSIq76dlwX6R+0MCNR
X-Received: by 2002:a05:690c:c355:b0:87c:a620:6fd3 with SMTP id
 00721157ae682-87f270587d4mr44300647b3.21.1789038745378; Thu, 10 Sep 2026
 04:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <003401dd4064$03929bf0$0ab7d3d0$@opensource.cirrus.com>
In-Reply-To: <003401dd4064$03929bf0$0ab7d3d0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@gmail.com>
Date: Thu, 10 Sep 2026 07:12:12 -0400
X-Gm-Features: AcwNN1U55WQK4Q9cXXARCu67BOT4tjTfcBxoPA3skgP4-nJ4DVxHxl6NuEnR-ig
Message-ID: <CA+5PVA5zGhw0Zg5s4TMWOer4p2tSdCFnWTXn8pB=GcZ=7zQzsg@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l56: Update firmware for
 Cirrus Amps for some HP laptops (20260909)
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1228

josh

On Wed, Sep 9, 2026 at 10:04=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to update the firmware for the Cirrus smart amplifiers =
for some HP laptops.
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit adbf9e5eaa7f94dd9a9b62330a24eb0ce79ff5=
09:
>
>
>
>   Merge branch 'lemans-monaco' into 'main' (2026-09-09 10:31:19 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware 20260909-cs35l54-cs35l56
>
>
>
> for you to fetch changes up to b33a1bc023aa70652b791380061b25f0d73cc21f:
>
>
>
>   cirrus: cs35l56: Update firmware for Cirrus Amps for some HP laptops (2=
026-09-09 13:27:47 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Update firmware for Cirrus Amps for some HP laptop=
s
>
>
>
> WHENCE                                        |   8 ++++----
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp1.bin | Bin 7680 -> 7464 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp2.bin | Bin 7648 -> 7440 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp3.bin | Bin 7680 -> 7464 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp4.bin | Bin 7648 -> 7440 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp1.bin | Bin 7684 -> 7268 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp2.bin | Bin 7656 -> 7248 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp3.bin | Bin 7684 -> 7268 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp4.bin | Bin 7656 -> 7248 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin | Bin 8136 -> 7600 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin | Bin 8132 -> 7572 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin | Bin 8124 -> 7600 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp4.bin | Bin 8124 -> 7572 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp1.bin | Bin 8132 -> 7604 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin | Bin 8128 -> 7572 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin | Bin 8120 -> 7600 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp4.bin | Bin 8120 -> 7572 bytes
>
> 17 files changed, 4 insertions(+), 4 deletions(-)
