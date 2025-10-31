Return-Path: <SRS0=a7Qj=5I=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2AFCCF9FE
	for <linux-firmware@archiver.kernel.org>; Fri, 31 Oct 2025 13:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94046C4CEF8; Fri, 31 Oct 2025 13:52:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7799C4CEE7
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 13:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7799C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VAvu85102774
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 13:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kTXJpWfGg+hlnLWupUemzrBqbFWMhrBDP1FqaKqPrqo=; b=W3ev61mIpQQCuqka
	h4+ZWQtZyHOT2+iETNt2/cmWQ861eCcYsMEuT9iDmbbktVmxwI6bJzhzjtOnexXM
	rm8w5ujHT1udzl7aaTtV6D4Lg48DjYNODPsKO4s02YCKjJlXskXljF8Gbg6rOYDT
	xjm95fGtTZBt6DZRxbzLS37RTZ5GfrlDsMgMYl6XqtBbv7EtEiP9PDnv+T0CzWfV
	ii5FOJ+rBVubTykKzaZar0Wnz2G7f4QP/38yofB4owdiCME5zXWDn9SWC5FLTwIp
	bs7PuqqDF9QFgJoNbbuJMxAQr3D06ifefIpPzmzKHEaPewP2gb3HfZyH7jzgq2on
	jCToxw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdkbe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 13:52:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf1b7686cso89977111cf.0
        for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 06:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761918728; x=1762523528; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kTXJpWfGg+hlnLWupUemzrBqbFWMhrBDP1FqaKqPrqo=;
        b=JIhSJa2JehgsFoD2zscbOE3Z5Dudbg0AZP8jIsCdJ+b653vb42aXbq+TSPLcdvrfEM
         3C7HK5kfQW06ZESrzjID/7iV/KZTa9BtCzv/QvPnYrFw8kiyWulGuqG8TKcuezE+/vtf
         6CiKk1w27SBSAcIilDPAH3bkg6UcbrtMRSm422bdY7Z9ORaBhKSrkjdiosj4JB9s7mCs
         tcEUCx1yGe8AK2jhy0Qm1dv0OV9d+N23nSvLZYpiGyyP7q6LmW+8OQC3sbwOF7N++qy+
         UFO4SOaDuAuzAQCohUKye3HXUo/n+ZD796eFkeaYrMsJde4sEQ55FjT/sSI5aq+T1e7Z
         zLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761918728; x=1762523528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTXJpWfGg+hlnLWupUemzrBqbFWMhrBDP1FqaKqPrqo=;
        b=Rq8S8qOoA2U+5C2eKVYjtGOyUFKUEK0Mxkr7nMoZX8s8XLs98OaBUrj3Q0GblpX6ke
         aH0s0hpBWkN9inTl3cvIGh9fvBIpMU2iYsA4OsYT+FMyy431Tfbor+mT4pV1qlgpTxXl
         lr9nL7RxgMhE5krGkR1QrYurG8xnZ3CsxHZbeiCnG2nlyzox5j2Fqoxp+L70DpvBckSs
         ao8ACLb9lkE+TLTFqnTD/IrXNFx7GzcHH2RKDZo98CE9IZZbj+KzH2UL8/9E0kwNLxEa
         fopmh2UJKleFUwYXGdxvDPq8nsYtGCLgchdNagfSr/QWVfzhYIeHEWJQVFviOhFWsXid
         WBzw==
X-Gm-Message-State: AOJu0Yyz0IL2Wj6/JDVuASFCM1iy+o40vaAunJ+Cz83aex9PaX0yaUgK
	HnHQU51ZrhnKw7a9jwxFBM41Nt7HXkBbZ3hdejXkqBLRV9Fv19524IffuMgJVIkqF8Ykjlq+bmI
	tZ4PK0NVA6OF2rAwhN7nSIs6tvHGEsv5cKn1L4RYp13QgXVOEXYeBWAHMvoWOCko9caLylBY=
X-Gm-Gg: ASbGncswxf+zw6bTBrmZKZIf2WmNNfvLzghBESkRwZqicFX5qQ8Am6r30oPG2r/BDyx
	jJesV8lIL+vfbSr16h+xmPUmXbAYHMn5yYUxVGm57AuM1/ZyruTy29w6S9gbKUtvQfhaQocrPXD
	d+rHq46ecuxapSYFa1c1XtO4sxTqM5JJbur23hL6Eaa+YDQMEmjll31tK3GVm28pW9AfGZfUDzD
	9HN8SHmvKUnAZ8cOLuwF4hpjDrickuQiQ8VvEXdaFYlDg+ksK8uD/ZZWx7+f4kaZZ9C5gQOypJ9
	AKLHCmMr07Xu85Vo9ZtzvzrL/hEMOcViUGZn0xrjf6Oa6iaod3/oz723d8jM9lzXa8huMeXn7ix
	UDKdMLc9Mpyhse6huKg1U/ys0gpTazFWWJeuxioABaXx54LAKzEMj56JfT59bDfY2rkjN24h3iU
	8RjxC6tE0kb2np
X-Received: by 2002:a05:622a:cf:b0:4eb:b291:36e5 with SMTP id d75a77b69052e-4ed218d97c2mr76663661cf.41.1761918727789;
        Fri, 31 Oct 2025 06:52:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxSUmONa6852waGbXUddoJZusG7NtsPXTooZSZykYl1nK7O8lJLX974a4fu1yChq6dOEz32g==
X-Received: by 2002:a05:622a:cf:b0:4eb:b291:36e5 with SMTP id d75a77b69052e-4ed218d97c2mr76663461cf.41.1761918727332;
        Fri, 31 Oct 2025 06:52:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5b5cd0sm510278e87.67.2025.10.31.06.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:52:06 -0700 (PDT)
Date: Fri, 31 Oct 2025 15:52:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add SOCCP firmware for kaanapali platform
Message-ID: <o6ta2s4ykj2kfinqrsf7ej7qjgfi6t6wyrc6jdpzjup6cveti3@gy467gpjkm52>
References: <2c54ba08-67b4-4bb2-926b-de0e7cdd47bc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c54ba08-67b4-4bb2-926b-de0e7cdd47bc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEyNSBTYWx0ZWRfX/r9SkjKhVy3S
 bMB7i92KrRufGXVlTB5Rx/vbuCCJoAuFfbvR1Mxi/uj1rfSsWaijM5pklFxpuelmUxog3WdoAgf
 tV5DlC/Nzecw/K0ii31Vw1LB/xjCxZIZZynv3AXQonjc1an0FFwH9ospCu63eJklQQbH2jkbTwn
 01IKifNy86CDCzuYsfH4IkYbGEWxXV46v1qjTBvjKiOz/YVJzNZHRKdqn01rj/6a92x+dw55Ag7
 7IAvXIpkvYPQuZaiTgdv0Gb+a8q6dCAAZw19A5OyTB+OldoEfU80g6hDo5eu0dsVjYJGrUDr4jr
 3pXBWV6t8pauaNzP2bdyhfcoyFwx7kOptUcg2XCOiUqGWCni2VB9sN1jtbs1WB+OxoazKW2rzv+
 rpf7XWOrTIOhWUGouY0aLNx0L8883Q==
X-Proofpoint-GUID: WZIW3eleoeC4qJawHe8GsiMUCIz9WbUR
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6904bf09 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=5lQpnyWz_aom1axwDDQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: WZIW3eleoeC4qJawHe8GsiMUCIz9WbUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310125

On Fri, Oct 31, 2025 at 04:16:30PM +0800, Xin Liu wrote:
> The following changes since commit 7234d25d1884114901070a9c42380e104e48a136:
> 
>   Merge branch 'amd-ucode' into 'main' (2025-10-31 05:05:13 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git soccp-knp
> 
> for you to fetch changes up to 90db1091087d0cc4af93160c0a52312738515174:
> 
>   qcom: add SOCCP firmware for kaanapali platform (2025-10-31 16:08:38
> +0800)
> 
> ----------------------------------------------------------------
> Xin Liu (1):
>       qcom: add SOCCP firmware for kaanapali platform
> 
>  WHENCE                       |   4 ++++
>  qcom/kaanapali/soccp.mbn     | Bin 0 -> 2359480 bytes
>  qcom/kaanapali/soccp_dtb.mbn | Bin 0 -> 94008 bytes
>  qcom/kaanapali/soccpr.jsn    |  14 ++++++++++++++

Could you please check whether it should be covered by LINCESE.qcom or
LINCESE.qcom-2?

>  4 files changed, 18 insertions(+)
>  create mode 100644 qcom/kaanapali/soccp.mbn
>  create mode 100644 qcom/kaanapali/soccp_dtb.mbn
>  create mode 100644 qcom/kaanapali/soccpr.jsn

-- 
With best wishes
Dmitry
