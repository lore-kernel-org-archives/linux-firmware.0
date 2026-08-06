Return-Path: <SRS0=isgf=F7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25E6C561E6
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Aug 2026 09:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADD0D1F00A3D; Thu,  6 Aug 2026 09:14:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786007676;
	b=PgWaBqDXxwfLflI+PwDHa4c1OILu+Eq47XF5yhelvErD0NiToc0+RNOfZULAJwJ2kKf2
	 AFUAHTtJZWZYcXO5dsgRFhB8cY8LffcF+B294+WmL7KC7XG83Rx2lY7LXEcqq/SSQxB/J
	 Gknd+hWH5VYmsoiNZd1DJ4ral3E/wM50nPXN2tFAaqsQPZSgKCbGEg7NH6IpCww79vIk9
	 aYRP5Pbs/Ah99yIjkaynx3CzNMMRqBklQKqsbMVLAt5E8ras5ys+JU9rHTHP4pAsBL8P8
	 +wtaN66W+ILwyhFvk1Qszrb6TI/FoD4jGyFG9Lx9G0XhxJrX8i47dUIubEypwbtJCgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786007676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/oI0JfMZETsCXcSZ5X8qaxVJCZziGK+rQ8dESfqnXcg=;
	b=v/Nw5YltG/3fDwTIV/837kExSocTbbLoSkQrOwQUh6eKqKsYztKOgBySJhW2EwhVoYtS
	 mcO707rEjrNRFxn+2zykBPL73a0rNfvCXJdbeZVdDawTtVydKEyRVxIB5a+tIB7k9fvJ3
	 lcu6NXDFOfAKG+zddX8dIXR86Gz+WOiWxF0VRmis7rGE/7T84kohYYT8DW2CdPsaJK/sA
	 mS1yCN1BIwn8bv33mzOI/liFrLo+WsW6P4yWx5IHLRugfbXK5llL6FUkqZuNGQOpmQ6Zf
	 S5vhluydnZGK14l746d/hw9d/IaiFlY0+ViJvGLbH4ua8q/tn6eHLbYk2ZmEPQDAcSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CIhSFRc+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YCY3vpl/";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08A481F00A3A
	for <linux-firmware@kernel.org>; Thu,  6 Aug 2026 09:14:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CIhSFRc+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YCY3vpl/
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 08A481F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769BDUY1137462
	for <linux-firmware@kernel.org>; Thu, 6 Aug 2026 09:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/oI0JfMZETsCXcSZ5X8qaxVJ
	CZziGK+rQ8dESfqnXcg=; b=CIhSFRc+WPD8W2RZoA8BdkLJoLYFHiMAiB/Ub9dZ
	RRwFXzPnoSDYnRkcJ3QqrJu6Ob5v6O7b3DLT55EbrJelTNojz0iklN9zo/3tDdQk
	APLWNlPV9dNU9aiv4XDBGWqEOJeRgv4028nkiJu9HVL9pDAaMG5LJ18cnGmb/CMm
	q01cP7Ie9AukOyr6DxOoD8PThqcHL+PNgG/WEsed2rJ8s2PsdQuPnSkYAQaIjP0d
	nBEgHjRdVATfoNJ+vZ6yl8Y+411QAkcihUAe9YZQc96N+xRae7yWIdIfzT83N6sO
	4vhZteEok3IQDYALtOvzabzd1TPvIdWmIoSIMqTlQh0s+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqdug0c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 09:14:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso33142611cf.1
        for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 02:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786007674; x=1786612474; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/oI0JfMZETsCXcSZ5X8qaxVJCZziGK+rQ8dESfqnXcg=;
        b=YCY3vpl/D8b2Pvm17iw9yWqjnvvkRCN8+zRXUpnpH83OI0swN0xQAgjxwgUvGd0XxR
         QDO+eKAoUhPaG4mhf9rjRvFmA4mnYye9oLRXjwebsqyw8OJgIBdUG+sOpGlJp79Aqff1
         w9TygTTr8Wj85PUurS06YeOKkNwCufRsML4TCCW2IRwomkblI/asFRlp+A5bH5TB2nKy
         oKoJILIhaFEVST3Y6yrkkrJdK62+no+PNz9by0DxjR9tsohgOVB+UH9lp39zFWyG+/KB
         U4lp52AwlYsTG/BVqfwhJ0dbhngkxyksvdd+/XmXg0rBovi6jd7udZLjvyWD+X+pjS6x
         runQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007674; x=1786612474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/oI0JfMZETsCXcSZ5X8qaxVJCZziGK+rQ8dESfqnXcg=;
        b=I8H4pUvu3DW1/sCdHzcR2253YLCDxSkwiaSF/P7F8ahaIDADKtEtlEyPl8jnjNUO7w
         mwYkj4tIbxUAXHCQWdOraMEQLkZuetwMOB+oXsCC1zVmzIXPzEZKZBaSI8GMpxcU2LEQ
         aYwr+dPoxSEk/C9WwNXIq//H4woWXaWOg+pS2bUyk2gff4V136cxuxyuy1LoAQb076lg
         IYiHvuPzwkMS1qjpQ63A7EgOBRMand2UzW/ws+haARhIyNjmVn6tUtAs7EWCuHh6Xac5
         MO7SCog8CWAX0LndcuDBYw0/ljJRQCtObzQMQ80tpcZBRkhqlqp8qQbcWYlI3wPANrU5
         +Jqg==
X-Forwarded-Encrypted: i=1; AHgh+RqM97XivGQYuV33jUWo5zcWfunNE9cZW/9Xye5flgpKqUY8+05WC8oeOVw1AHw1Z4z1nv7RamNvNV8te7PSjg==@kernel.org
X-Gm-Message-State: AOJu0Yy9jzQqQKVrLYk+KMnHdLHAaScvca23jPotVAPDkpiC0dFOkZyk
	9H6k/EyEUkQUexVaEuTwIvZ9sTiKkKl7y5NBED1zGUqlSTXl6xfNv9DjYBda2meHIT/C4MyzH30
	x0Fv1PLln4qnRty6jU4odTmSGiFasdzzsvAenI28aoo9rGnhJH7g9gUNHXcjZXNE=
X-Gm-Gg: AR+sD11WxcVr4y1/tui06XFP6liKj9hXPVN4nFhlDWaB+g4mU5kQMJZIq9r4dvUUCVk
	DZNnghmWf9KTny4ctNX/NtJXYHvvLoosbgJ/WdKbBOhpAP1qdbfdt2bg4V1n0uPdIXbcXQLA0Vo
	uHwJcs/VJ1sAhoAg1uuwfpiIcXQRwwpVrlUJ+yUvn6vp6CCtKJwP2MTIdJPnzpJtxyjbxDRaRhI
	wvBTE2EzgwhMyzUroSXOs6fjgW4bKjwW4zymXb/hhYZtOcgCRAyjaeNgdb3LS9QP7JxJNjdVsDQ
	PDK9Y0dfW0nHDh5KXQshJS56UG1zViJ81W3QhNecoq0rxFYrVWQYlsiBQd9Wvy6AdLGg/51hDhd
	cSYcYfM9oxkSMCHGw0c7VdIT8QrvSLpgzssJfsX5DTinDTy22kqcLOFCXhtt2xHKv2C1lg7p4Ry
	hCUoe1lfsYspFplQ==
X-Received: by 2002:a05:622a:591:b0:52b:6543:d8a with SMTP id d75a77b69052e-52ce6110546mr130660261cf.26.1786007674129;
        Thu, 06 Aug 2026 02:14:34 -0700 (PDT)
X-Received: by 2002:a05:622a:591:b0:52b:6543:d8a with SMTP id d75a77b69052e-52ce6110546mr130659781cf.26.1786007673675;
        Thu, 06 Aug 2026 02:14:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62af86asm601516e87.52.2026.08.06.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:14:32 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:14:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "weiting.lee" <weiting.lee@airoha.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, Joseph Lin <Joseph.Lin@airoha.com>,
        linux-firmware@kernel.org, Lucien Zheng <lucien.jheng@airoha.com>,
        linux-mediatek@lists.infradead.org,
        Albert-AL Lee <albert-al.lee@airoha.com>
Subject: Re: [PATCH] linux-firmware: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <75rjyey5vhw376f7swxkdlzfxp6t44znped5r4l6iey6wnm7j7@a6qnh6iurmok>
References: <20260806090122.1391450-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806090122.1391450-1-weiting.lee@airoha.com>
X-Proofpoint-GUID: x4cd8nsJC6SgXYzLO7fhFmgZ9cQK3cU_
X-Proofpoint-ORIG-GUID: x4cd8nsJC6SgXYzLO7fhFmgZ9cQK3cU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3MCBTYWx0ZWRfX4/ahNESd+Y3d
 ikxQ5IMCvQB8rWweWvx9DthcIFfgyKwbhIfdyzYg8ksZjWE7YEyEqkZFcBmdmzlfXSAAtmn3cXE
 KX3aRDUvZtaQEaF2ra4XcgPxlQjT0fUjoscOtk2WS9FIiJrV0o0CRvzBoYXM00/H/sZ/LaoW/ar
 kkAwWTGmdtZQPOE7JlxsHribtBT1J8lLL4Qs3HT62zASpr6vsJEPnKttJAAZr/uEgFE12ObXH/c
 5iplg9yLi8WFwhV20lJugAt0rOqSYJki6Zrj7NbhLNGXcGbTD+/1PWVpL404z/1zjGfT4YVTbsa
 F/ZAMsN5CdCouhXU3Jsm9w55nQw2hbx/LnZ6B1gs2dtkCobITeDBWEkGWcDbEfzgYjQJcnKtX4t
 HCcPAWulHla+ixfFK3wrB8SKRSd/PDAGPTr1oZiKXGgxl6O7mu4VraZuSBaiSWRLisMapBI1x+n
 PcfJrsPWIYSB/8miVXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3MCBTYWx0ZWRfX6sZvYwKeQ6po
 fdCQwHgQQrK07n2NDW1hwhOKx4m7S7gNUcBvv2Z+XDt3VsqcT/AYZWB/W9tsU7BV0YOcj/Hmupz
 yVBGP3HTwN+kWyjMuXLR8oTgw05erR8=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a74507b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=JGXwu8-eAAAA:8
 a=uDFsXW_6BNhtH2ik2TIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060070

On Thu, Aug 06, 2026 at 05:01:18PM +0800, weiting.lee wrote:
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> Version: 26071602
> 
> Signed-off-by: WeiTing Lee <weiting.lee@airoha.com>
> Reviewed-by: Lucien Zheng <lucien.jheng@airoha.com>
> 
> Signed-off-by: weiting.lee <weiting.lee@airoha.com>

No empty lines between tags. One of your SoBs is incorrect.


-- 
With best wishes
Dmitry
