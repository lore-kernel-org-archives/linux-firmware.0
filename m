Return-Path: <SRS0=2557=TK=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DE2E7717F
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Dec 2024 10:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C33ABC4CED4; Tue, 17 Dec 2024 10:50:06 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0A17C4CED3
	for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 10:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0A17C4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e3988fdb580so3989204276.2
        for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 02:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734432605; x=1735037405; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C6yX3Lt+G+1Go19CSwg9+Qnnle1vlEo4Fky7b/LZJ04=;
        b=Rrqtiagi1M+j9x6BV129XsgwpKI7yRXAxXVdjEsAIE6tKqDAYA496lziRMQ+jH0XuM
         qKmb8NNkl1v2la6X/ISvgp/bPav44p+MkK7QnYMVoMRNSA0Z/5myTajOAFuviUv2hH6T
         Z3fLvUfp4iCF6KV28voCDEuZDMqH8HNz5lxrHFDG6mO8vwDnoleBH2BBrlb79VHyA/eW
         6b3TtbdrEnTmOR5OAEWCEge2MSyPB2ed6Jk3L1bf1kPHnOExio41msSZGUo+diFF019f
         RbwaTqmE5nihRZ+o5ET4nH2F8X4sS0xD9NIosERFKX/T+jJjtYWVix+QelNmsr9bSVY+
         hldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734432605; x=1735037405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6yX3Lt+G+1Go19CSwg9+Qnnle1vlEo4Fky7b/LZJ04=;
        b=Pq4aUSHw8NScq6apq01oaP3tS6RUNKbc00oa/ejBRzuMQKUzKtGG/jVEm1UWNEq15C
         uGrynEgfUQCD5NDmzuEmpriq9BfEi3ZSzyiGtwwqHq+1Yra11TWWzcXjI/6EKugewLzu
         HXIdyJiJ65aM1c5tkhIy8qnqtNr79L/Kr4YrIxBU1km/wllXO2EskPC9zLk1imzz3H52
         TcVO7LRL6eToRlgDruREoAKkrNd+LaKwkH7ong/2z/c+vHZXvCQtnspbm3NCYhxbGria
         twvYIPR/ACX3f8tl7byYw95BqgsK+KDW7Gng4RqqGeVZpZ/Zd3HJxsWldVuqEVJOGQAP
         iA1g==
X-Gm-Message-State: AOJu0YxM3L8cqT1TLS1NnpCHs48wrwCy4BoFZk08bgxHvgLYKL1TSzQa
	nu+laXTHYMmoQZgE+LVZ9xDkKeaY9hGneRWGcvYLNtkxlk77nmCCemB468ToDlOZVCjQeSptRxH
	lgYPEtqBR61tyUtEfXeqlGFPSGfzoqkyhTFKS8Q==
X-Gm-Gg: ASbGncvH3OcRGcklmmr1NcxL6BakgHMlEj5Nl/BgdWQHpOf4smUbrpWE7kmc6JsGm6s
	YTZARen7WUV2OAclVMtktROe1EyikQW2xG8darOJ1n5C3lXwPD16R
X-Google-Smtp-Source: AGHT+IF7pKLzdwzM8rPVEHF/E9YwiIQVxuCWk3bmcWl/sVna6j2whEqaJ0hr7sDIc8MibdnQ+AgnX6q5+U8AMw5S0ms=
X-Received: by 2002:a05:6902:1209:b0:e39:a15b:9084 with SMTP id
 3f1490d57ef6-e434f74807cmr12432189276.26.1734432604832; Tue, 17 Dec 2024
 02:50:04 -0800 (PST)
MIME-Version: 1.0
References: <6e0ae91f-7233-ca54-953e-734a71d76e22@quicinc.com>
 <CAA8EJppvAPmneYtixMhACf7NJdOX837UFuFdVCzbzBDMOSDR0Q@mail.gmail.com> <f2867d67-8b89-fcff-80c2-3de46806a590@quicinc.com>
In-Reply-To: <f2867d67-8b89-fcff-80c2-3de46806a590@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 12:49:54 +0200
Message-ID: <CAA8EJpo+6r61Fcu-jzjdcrT6ifkmTHua5sdsuDpfZwZuo=JEBA@mail.gmail.com>
Subject: Re: update firmware binary for sc7180 and qcs615
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Dec 2024 at 12:48, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
>
>
> On 12/17/2024 4:12 PM, Dmitry Baryshkov wrote:
> > Hi Dikshita,
> >
> > On Tue, 17 Dec 2024 at 08:10, Dikshita Agarwal
> > <quic_dikshita@quicinc.com> wrote:
> >>
> >> Hi Josh,
> >>
> >> Please pull below change, and as discussed, skipped creating symlink for now.
> >
> > It's sad to see that this change wasn't even verified:
> >
> My Apologies for missing that.
> > $ make check
> > [...]
> > E: qcom/venus-5.4/venus_s6.mbn listed in WHENCE does not exist
> >
> > Not to mention that you Josh nearly asked to add the symlink in his
> > response: "...but you likely want to include a symlink for
> > venus_s6.mbn ..."
> >I had a discussion with Josh regarding the symlink and he agreed to skip it
> for now.

Please keep such discussions in public.

>
> Thanks,
> Dikshita
> >>
> >> The following changes since commit d4033141873bbbc79c954dfcea502726ee278c5e:
> >>
> >>   Merge branch 'robot/pr-0-1734347915' into 'main' (2024-12-16 12:38:57 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> video-fw-SC7180-QCS615
> >>
> >> for you to fetch changes up to 07479dbb62054d362a206e71c2e4cb52181c81d4:
> >>
> >>   qcom: venus-5.4: update firmware binary for sc7180 and qcs615 (2024-12-17
> >> 11:36:00 +0530)
> >>
> >> ----------------------------------------------------------------
> >> Dikshita Agarwal (1):
> >>       qcom: venus-5.4: update firmware binary for sc7180 and qcs615
> >>
> >>  WHENCE                      |   2 +-
> >>  qcom/venus-5.4/venus.mbn    | Bin 922240 -> 922216 bytes
> >>  qcom/venus-5.4/venus_s6.mbn | Bin 922240 -> 0 bytes
> >>  3 files changed, 1 insertion(+), 1 deletion(-)
> >>  delete mode 100644 qcom/venus-5.4/venus_s6.mbn
> >>
> >> Thanks,
> >> Dikshita
> >
> >
> >



-- 
With best wishes
Dmitry
