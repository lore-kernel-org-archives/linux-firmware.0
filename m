Return-Path: <SRS0=o2s/=ID=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EC6CC6B0E
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Oct 2026 08:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E4DE1F00898; Tue, 13 Oct 2026 08:01:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791878484;
	b=kg+RZMqnjncTqlCsMGJ8ppn24ZJVV6j2W24dArMNtGeJlAVjkUkCP2iYD9phPbTiDmyY
	 mP20oFv/Dq/HHfi867lMsTek/S2Fwcg9GvEGJAf2PXui02NO2QP1oXXs40CKpwt8OdBIT
	 SP/4jV3yQPcF0HPSRNV+dTpn0nvLoWFl8DWF5zpygJGFbhbQF/09eXgMcJeKOjXST2TE/
	 47+5K10unjqr4Km/okkTKst95L9S7xe5R0UyAnxKp5TF1jEc0P54p9yLy7U//7QCiwqRP
	 t71WrkzURRXoS284Jmwz1o+kQJSGDOfT+j/BqtYdlCmJLdi5rz93Vmi52b7jJ7+tbEg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CI/D037FfcASKbB63jUFaLBFvbqbIWzRdt3aqQe5dKA=;
	b=m0vtJJJI3eHL6FPvaTbVDmTAGda1Z9smdQPd0Wevr94FUIlCjTwMM0Rf6g4YCzxiOLZQ
	 uU1nCstMN/8/YB+CmQdCgoHFk0ZVysGl6cDcvuyN94VrLbUItdfJq9aUaUyOfFhIaDUbs
	 bSXjtcVWaol+n09vqS4FBn1hZI0Z8clqqjFBw6LgxWSoTX3T/4XwO8q3xSL9LhtdN+Zoz
	 18KRd3hf1+gwUFz2OWV3kLOyflE/bbuuJc+E8o7Fh1ovVR9aw5W4ehyEDcfkYqFwhOgwL
	 9xPQ8ovwYdPD1cFjI+bBsrKzCqcWyd6ZzQLLo0lRFsFgJy3QplDrFGVOmVMHGrE3sEw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0I7p4p0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7GgBVCK;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6AE01F000FF
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 08:01:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0I7p4p0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7GgBVCK
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B6AE01F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21E3C3752542
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 08:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CI/D037FfcASKbB63jUFaLBF
	vbqbIWzRdt3aqQe5dKA=; b=g0I7p4p0RnMT6rVqv1xpp1dXvUvItCjX77zgSndQ
	bBcjyG6S12HM7Ga+6+JgFiON3QMxzk23CNVCgXMPnAf9CFMyWbOgi7y7BaY0GGTm
	B62JQ0uDqvOEQtsqz0ZeD9i3W+wI0b+zmBGWuNcnsyjNP33x5D31NMwilbO4Yjvt
	G9ZucmrjePJGGw/KWt63noV+sfkwWX25+OG4nsfXj6GOmmfHVT69yQ4D8GP0qa/S
	MtY3NqtaKAXmVUVH5a96K3rX8FhbifFEPsNduafEGQifHlOIYCQiDI27VnWOmpOy
	lodtMQ9h4sO7oPxxznhNnYCYtwA34nk0ixK88fwC1mMVOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w2yqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 08:01:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso939075085a.1
        for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791878482; x=1792483282; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CI/D037FfcASKbB63jUFaLBFvbqbIWzRdt3aqQe5dKA=;
        b=b7GgBVCKcSPZtydPzEWtzt582dcJKI0+AKTtWOKOGHcr/yEIoE+afQTxloKqbW8psW
         8x9j8jSbpH9lxi6tdx/DvKYeXcwqoTemo5qAmCruXUG0YrjyUiyHcniRtrvuFNPuIhl5
         wunNZ7O2rTzbPO5D1inyLBVZWby+JSl6B+L5duANjh3/XTQCLcjQPZUSgMLDUK9UQCF+
         p2xWymOgfWzTHrCaQp/o4oFrlaxMVYPTcodl0dhCufxULRnk9ia51SWL+P+lZohau3Y1
         klODjNNUD5GDSwYk2g53C6QRevBol+j+kcr5QXV1dxbGOipbiTDwrSwsbAxA18oGUWlH
         5aAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878482; x=1792483282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CI/D037FfcASKbB63jUFaLBFvbqbIWzRdt3aqQe5dKA=;
        b=Z0aG5O4xKNTGaIm2SEk6B6FrlhN7USk2uSRYwIc4fTk4htzvwh5ZEV118rWImneqCF
         4hVIcUBgrAG6/b6UiEXfQ17LwnK4KJypaVJG4BW+ceptwwJu4KJRZi0PkXumTiiW1cFY
         2cPQmgD5VRYCE5GJyuuSOfTL+3fzIYEGSahgBj0daRDTOxZkT4uhOIYp6JSBXWqgiNrg
         p/Ni6S5nF3nzSD8SrKeM3Oc0XDWInYvEKRgorjwJ6XU+Lp9Hm5Ovivzb1HhZblZnYKr2
         19dMlHwlOONbhy711VdfWV/HmsINDiXYUS5JqNCosLX4ysCS3iZc38dw3zmtmWr8nFIc
         8Ghg==
X-Gm-Message-State: AFq9FYIRclrfNh1WCvfc9omz/8QsBKSk54NnX2HFu5RIpo8lIvS4UlcI
	mXepWcsRyw0XpGzTikUjcyR+VYnoU+3ZMZUjorPMwO2xOBdXpyc40OUBniTNpa8cK3/pDJ0qBAK
	Z3w1OBRVre8flQr8TmPJ+cQ0fLrCGgYEG99NOTMxQy6GqyNhQHpMbWh8RN9Nl2Hw=
X-Gm-Gg: AYBFou21QmX3+smrdqcXY9wIyCdXUIU88B3cDdXiFp4bclbK5Aej42NH527pQ/1VAkp
	FNmBZQUcjAQ8UCNVcLVLbC8DH539poI6KlUhvU87x5qdrpZneLsOyFwy4o22me3pOW/VtyaQ6Km
	ZKnC+hkwhVtXgm8kbx/NMdAYFqD+0Cr4jY6LUGBSjkxxrIZW5fGpofpp6+27DFpdJPka1aanDv0
	HpuSrsQwNqndH/kltoygKX+JgbTfNV6wj/VC/V1fHHxoQ25K7E0dNcZ6bshhee0dTu3fCyCUsew
	/pwXuqsigQelsp3CTCvEsmlQnBYfZNLM3rjD2wzM/OAgYgsD4eNSAlnx5Y1CFZGJ429xuYBK+B3
	coqyLpAuu3cGBq+5wlBsZ6WDLB1JwIDeZV7zvlrTCL/xZ8XTkquBfobuPqeg6GT0yqY3/KGnDPx
	C72SU5LEOAKpvk
X-Received: by 2002:a05:620a:40c8:b0:93e:63ee:2ddc with SMTP id af79cd13be357-93ec1486c40mr1700962085a.23.1791878481593;
        Tue, 13 Oct 2026 01:01:21 -0700 (PDT)
X-Received: by 2002:a05:620a:40c8:b0:93e:63ee:2ddc with SMTP id af79cd13be357-93ec1486c40mr1700956985a.23.1791878481020;
        Tue, 13 Oct 2026 01:01:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caab0asm33125451fa.18.2026.10.13.01.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:01:19 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:01:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        psaddam@qti.qualcomm.com
Subject: Re: qcom: update HPASS firmware for nord platform
Message-ID: <bjivrm2mxexrrwxo7gcmrkj5rbe3utz2kpcjx6th7cun7poq5m@iagvtemjmtec>
References: <c1b5ae13-3a09-4cfd-97b9-09e103ce759a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1b5ae13-3a09-4cfd-97b9-09e103ce759a@oss.qualcomm.com>
X-Proofpoint-GUID: 1riX9kPeY9a973Cz0LYH_5txQ8oatz-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfXz13C62+0TtJu
 Yuy+tIMNNq41hH7wsuQQ3mytr5mFvV/wCxfv58G6Saez1ZOjT3o8riiY3KedT8AOGD2dx/tIqNz
 n/J81advWowmgwZ5+j7OpZCOKth8Nv4lMKydw/LMTIyq/30LYFToUIBoKKcy3vdgCeJ6rSp7azG
 QN3zS0sZcEZvG2lIn06vtqFejMDTg+7vF0nw9asRzeyCV2m+m+mnRFR/lVphDVQhEqDfAvJev86
 jDPVe0jrql/GpN84NbGH7bFsYURua6dEq1WAgIRa5ZHFNd8V6gttlXgMGqo3+ZJGlxHM080sbqn
 DiX6BJqCJQuJJiP1VueA2xIKqzcgIJuYzQaRorCJ5xF0wgATGWAn/NeVM6RZ88gi+K0WIqGwi+D
 4L2sMIJXHG2ukvuQDp4Qj4bz4HpzuF1khgdpwAN0fJ2mTvFzjmMOLwuWsy49wvc5Bc4cnpx/7RQ
 flX1D2tbRHxLw9BPH0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfX4sh0reDex7It
 cevvHby9M3ULnP2r/uImlHWg8KtbIDXPWytBSecjEX+6X61a4ltdBMfx6AYhNsAKN2WscsHlbaY
 5zRC0CQu3+8Gy00OV8w8jVKb+4UTAXA=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acde552 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=Ex97tpz3VLO3qiaL8s0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 1riX9kPeY9a973Cz0LYH_5txQ8oatz-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130031

On Sat, Oct 10, 2026 at 01:21:21AM +0530, Saddam Patan wrote:
> The following changes since commit 7be47f171be4138285f59f58e1a8aa601f57350e:
> 
>   Merge branch 'amd-staging' into 'main' (2026-10-09 18:14:44 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-nordqlihpass
> 
> for you to fetch changes up to 9bedb63eebbe4b5a9d9a7918ee81930bc6c0868b:
> 
>   qcom: update HPASS firmware for nord platform (2026-10-10 01:17:28 +0530)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1299


-- 
With best wishes
Dmitry
