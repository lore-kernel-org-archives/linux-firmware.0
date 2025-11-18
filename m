Return-Path: <SRS0=fUOl=52=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7320DCEDD97
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 14:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F9E2C116B1; Tue, 18 Nov 2025 14:27:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32AADC4CEF1
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 14:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32AADC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8lDXU2755669
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 14:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Py7B+vNKCoZhZgIBBfgyDviV
	I18X09rQnEPsR0DVA+E=; b=eNYP0Ej/uLqG4hJvwrWSIopuFK+bKDaRx8FvmIW4
	FaD9HxYffxAQBc+aEb8XIlkdSUYFrXZxR+fN05u+jeVLJbh3FhAJqL/OkyYrJgCC
	MiuNqgKE/7uOV/VxtSpUa2vR9peoy2ISfaCZyiFIadRZH9sJLpd9aYXIfsheZQL6
	fAQWTFWLfYuOczNZNk+m7jyg+VzFbVY1F4fdkjfmf46JclFIan/URYfz1VbzRU0l
	1+pAarQfmlYKBszX9T7A6UudiLK4ivkx9AMXdfjpMwwPeglt6543A3+KJZik95ex
	eqZxmEaXfAdOzQ7Rmyf/RZzGNuQMz1lRVnrmecdqw9RkqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj0x9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 14:26:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso6753069a91.3
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 06:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763476017; x=1764080817; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Py7B+vNKCoZhZgIBBfgyDviVI18X09rQnEPsR0DVA+E=;
        b=Z2BEG2uFTe9fQom8+kS8M7W6rsXc/v+XqMMConGvUJ3Q+fwuucVTUoRsI4W9Uxx01x
         JLUM5lvalS/Y2g+6ke/tozYd3EuKGrbdhh3vSV0b6i4l16l8Fw83C0CUpPDocGCmWyzk
         c/FhKExMITn8ccTCQBKKpUkVZS8P1/oM7kDC9mcpefER7z+yuH5kuUycUTOWX0U8/HrS
         Zr4hdJ9p2wC4Nl8sVK1b6XGX+I79M38P/uNyfb9sRDi9K8vx7KgB8Fa5+L/lXqRVcKLA
         WnkZUQQ70GQa9eyO4Jkux4TYKS7dkqfn03ab/ilHBYZwlXW9IRokQeqBweXTjqzirQRh
         gUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476017; x=1764080817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Py7B+vNKCoZhZgIBBfgyDviVI18X09rQnEPsR0DVA+E=;
        b=BKdf76dkQFO5F1nVVTq5/yXsf8c+TKCj8PcB1Z1T+BceliUPluUN1mroKpnXj/dxt/
         d76HtJMoR67IXHZdFnuAZKDlp7UdCtVO0un5044VLq9L3xUMqEVoRdOAdOGACCVLcj5z
         ZVmoS16KHvY0L0bUMyoY4xCsSKFnZ/NQTyxKGkuuEncF0WIOO3Z93ghzYhTbPdpaSZsv
         B6hxni4rXyW89I9h7XDZPdw1YbedWVMduC36Dgz57GR4cvEQPrsOTWrzovihAu5EXBaE
         nruj9ykFUvHIdkv8u28tkS6Vn5m8NW43gdlvJAEzjsAL2VOC5lo95dbSxboHgO9uCWdG
         l+gw==
X-Gm-Message-State: AOJu0Yz7AVJraQFbSZrb3oQuR70oX+Jp1IpB2U9GKVji9AMvQcZwmkF8
	E0JNnC0xO90Wy7sHDqSsES7TDRu57srH92l4fG6GyeSpUFldbl/GD5OREoQ5xhQDi7fznrWm78K
	y3wKx9/jCtlZvEwDfKRjJg9DdKrNKK/ZFZv6xvjFSMQl93mAcAUt2+zPn4ixjv4VtpxAgkEo0uF
	W3mOAOCQd7QWnMPMvKvC2VdlU+I6YX4fADPIWfPA==
X-Gm-Gg: ASbGncteh88RRykFS5qAD8hUC0yb/UlttlY1PrpFq/VwSBMKkvJs1hzGlqajIrYmLvQ
	WfV5EWd6lP1Fra8FKXw/cMurO5uXXkXMeQ4UKNVL9QqYTj+cNZc9dsVgJhzIg+9w6zuHoKqH6T3
	0KX/KcyXJMOxfEeSLpDlZBtQcRQ251OTdjkoTnuJ5Ka+dE+QS+6lWAejrOxvzbZplGv1kKQg==
X-Received: by 2002:a17:90a:a884:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-343f9d90c8cmr13236436a91.6.1763476016682;
        Tue, 18 Nov 2025 06:26:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGevqFo3JD5I4v4zC2ZcE6mAZWK++B0e3tffg4SRngLSOLDgP+RSf/G6Ejymw9in2JrTBIV8bACSHIMbHdNS34=
X-Received: by 2002:a17:90a:a884:b0:340:c60b:f362 with SMTP id
 98e67ed59e1d1-343f9d90c8cmr13236415a91.6.1763476016168; Tue, 18 Nov 2025
 06:26:56 -0800 (PST)
MIME-Version: 1.0
References: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
 <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com> <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
 <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
In-Reply-To: <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:26:45 +0200
X-Gm-Features: AWmQ_bkW9pN3EPgnKGey8CjX0BtQa1EVaWLb8lNpP0dmGtMX0ZPNH79b5mMg9Ng
Message-ID: <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 96gPNpznYDSQPHy4-I2HzNG37IfOzaRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNiBTYWx0ZWRfX/42/NoIdfBZ9
 Y3ChsiXKbryT45uct9umKGJ5MkzYjF+SpEZIET+fRdiyVZXRnvL8sO3BK+F6iVvfWbxtweecllv
 sECxioaZgOy0h1JB6tTL3yjgPOQ/4Eg/40rXvi/VqTtani1jYlWGNjFhaxMuMh4RVJOIkNqGyxv
 g85PXRhtXsehQiLkJCuV0m4vON/8lxsLXAEZZvSKLVFN80XsUo7kZj+cXqFoqUoxHCaWh/dp2Pi
 2+lN7hL7ox9Tw/jMM2gt/EiacWlzpjeK7KcAyaJSszvxn929Vn3DAIZwzIJXD3ZK6fwBZkd5j2N
 JhKuREOCywf81G+M9gVCfddERWfT3BtehlMX7cO4t86PgBdcbFZPQQ3xVULkwUSj0m9KD1B+SX1
 Qbz8/rsiiK5wewZ/KZOfXA4eD/hBmw==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c8231 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=0Hc327gwceozHtBxTukA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 96gPNpznYDSQPHy4-I2HzNG37IfOzaRu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180116

On Tue, 18 Nov 2025 at 16:21, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
>
>
> On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
> > On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
> >> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
> >>
> >>    Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> dsp-fw-kaanapali
> >>
> >> for you to fetch changes up to d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
> >>
> >>    qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
> >> 10:20:00 +0530)
> >>
> >> ----------------------------------------------------------------
> >> Venkata Kota (1):
> >>        qcom: update ADSP, CDSP firmware for kaanapali platform
> >>
> >>   WHENCE                      |   4 ++--
> >>   qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
> >>   qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
> >>   qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
> >>   qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
> >>   5 files changed, 2 insertions(+), 2 deletions(-)
> >
> > Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
> The files should be covered under LICENSE.qcom-2 Made the change to the
> WHENCE file to reflect the same as below
> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
>
>    Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-kaanapali
>
> for you to fetch changes up to db069c95dcc16ea84dacb80488464e843ea252cc:

You've silently changed the licence without mentioning anything in the
commit message. That's a no-go.

>
>    qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
> 19:45:11 +0530)


-- 
With best wishes
Dmitry
