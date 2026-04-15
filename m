Return-Path: <SRS0=FX35=CO=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5B5F419B6
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Apr 2026 13:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2EA44C2BCB3; Wed, 15 Apr 2026 13:23:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1FE4BC19424
	for <linux-firmware@kernel.org>; Wed, 15 Apr 2026 13:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1FE4BC19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FA4YgX1701772
	for <linux-firmware@kernel.org>; Wed, 15 Apr 2026 13:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UwsieMSBoY+yAvu223WRAfZX
	Eg81cAQA8pzhVXB6O5o=; b=Ho9H8LZw4k17+0l5oROWZsHJDH6OdNq6E8OufDNi
	4E2hLBXESDUB8CFfe3O7IHRBhbMZ0OmviEfGS5EdqSBiAQIwwJV8Wr1VDhjEomHL
	9L+O/l/B1vzLbrT1sGNnLoMUhMnhhhWzHmwlOesddW7lykSS+cZgnYSmUGPujDBX
	1buB786OHjcqqNgp5qJrJT7yiO/LWIdzBZQ9QWSgUU0VVAcuDAtDjj4XPj3F0zZ7
	hXqBeieGXyHMsb9QKFh0jZXQyKN2sAtXlCxyo9QeqHL9LuAFOkZ4xOI+bCXT038f
	D6hl5rlfBsScqnLO94uWQD0QRu8wWit3/ydvLtt8vZ9ZwA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56ue87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 15 Apr 2026 13:23:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6130270a5f1so402814137.1
        for <linux-firmware@kernel.org>; Wed, 15 Apr 2026 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776259431; x=1776864231; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwsieMSBoY+yAvu223WRAfZXEg81cAQA8pzhVXB6O5o=;
        b=L3qO09l04RS1OWIhOYbTL2hYn6W2/qPXtwCit7OVT42K9OpkX3hXL9m9exxJczSpuq
         rfLEtxttAOiZBBJoDAoi+Lqx58KZ7qfN5TpFjuGFJtxKUn6aZXuihozWlR5m3MWyTER3
         lKqfVUs/ssJqTa/pYXAw1Kuu03b3pwHnd9f63DLu0MUYNiJzcYt4I4NI0OF0rtkF+xxw
         CdqmfLWGrTFnA6u1bnTs5LdXkirqgBYZWWNvXpRTe8zhQi9IetKI3+6/dcifUOnm88Ud
         i6CllV7e8H6bzopeYSfDD461E8UoyXChr0vrLhJq8TAkFwY7pB4xO6wmiSgiAWNKvsvL
         JHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776259431; x=1776864231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwsieMSBoY+yAvu223WRAfZXEg81cAQA8pzhVXB6O5o=;
        b=YzelW02I8qvAqwkNEUZKkhAMNkOXL5BkOrXzfnrTQRXNuuJZ1rx1Rl00OGmyS+jdb5
         dfnMidG4VvDSKwBZmNJpnejHY6o0x2Zk8mCa1wllv0HmLhy8ikWqGQbAuX+PYNv5pGd7
         uwo/dghbprQylyfjlULYE92uPXiMOaNLmFJZDErYZZNKfcDi92Eiz5AJn87D4xY+PwL5
         g6AW097WPvGmDzLkVYt81K2r1f9jd/Pdq2z50Inr3P1BCCOMVviMh6fa/XNS88BpAZZO
         zTRQ+bbDuMirZPYtzEW+u1BhwvCzDUpbVbW2DLXyow0K5juZNUHY3fvzlt1X4+3Sh+IO
         LEyg==
X-Gm-Message-State: AOJu0YxhObcuNoIXa1d1nZD7HLPtlEzD9i4xcvcgFPEWF0LwjpCvbbxI
	mgtU2XI0dasjKgNDj2t4StWLXIWe7u1cZwH5KyRpNozQEh7KGD/ua3x6pmgrgmfSdwplko89a6e
	I54u761zJeEmMPOl4mO645qJEoSw7KOex7bfQUcPl1p5D9mAGxuQ2HTv3p9uDbpk=
X-Gm-Gg: AeBDievD3GLOdOsPUHrEnwx1YpxVdGapHNbI6hXRB99HcK1vXwQpuxVAYSdtiSSysmW
	SqTNsT684GLDaw+bXcZR99//oyIb769MiZJ7hgkTnEarFgGPH3tKJRPoWzVxNbLv6nprmFXaPoZ
	I4ID+r9aba9D0u4JhQaRgpqEq9Yb2/FAk/Nhz22+m6fhSEL2M2HjvbW/wbvkk45gt4OIRNqKjNf
	sNAjrnvpmv1VbQxEA6frfM9XXWFiQ9zKBBjUtYcnuQkmFkXi/611D3MU/DzYyRoO7s04LC/iuoA
	xq80z2uwPNnvBdbKubVigvYzaZS84zqG6FHMKzz6pPoYg1T78g4iOkzB3DruMUdn2QZU5ro6dyy
	fKDaq3ApzM47FM5seRR8vjEplr0CcktBR1tcfTJoDeysGCY3C67UW3vA8wIvVSV8R4+dnccjc1D
	w6+WAs3cgNAhO889pwdpB/h5p19Xw+CvnIkRvk111LCtXWYA==
X-Received: by 2002:a67:e107:0:b0:611:c543:8fff with SMTP id ada2fe7eead31-611c5439803mr3031853137.4.1776259431163;
        Wed, 15 Apr 2026 06:23:51 -0700 (PDT)
X-Received: by 2002:a67:e107:0:b0:611:c543:8fff with SMTP id ada2fe7eead31-611c5439803mr3031827137.4.1776259430772;
        Wed, 15 Apr 2026 06:23:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ec6c080sm3920741fa.38.2026.04.15.06.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:23:49 -0700 (PDT)
Date: Wed, 15 Apr 2026 16:23:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>,
        kssb@qti.qualcomm.com
Subject: Re: qcom: Update ADSP firmware for Kaanapali platform
Message-ID: <6arbqo7kx3phkkbymfqcqkzi6kxv3x7bpxwnzrvnsoilhmyrnr@yol5qdp74f7o>
References: <b841105b-a766-41c4-b50f-392a06fe73af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b841105b-a766-41c4-b50f-392a06fe73af@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Op7TCdDskp1yBnoGtx6diAGDnBZ0fOxI
X-Proofpoint-GUID: Op7TCdDskp1yBnoGtx6diAGDnBZ0fOxI
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69df9167 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=Jr3nPaQuTjCZo5LgMDsA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNCBTYWx0ZWRfX2umLYhjrJx9P
 Lk8HXFPvnCtYOq1Ei0iz9ZFJ5WBayhHgUVcweDjIGA5wqG2DesGaZCZZt1i9qC7AL+ojgElUEfp
 WtWqM4DRlawM4SuVbPeb6JdZELueKiJPG8EIaEn9YOcCf1sZ71BY4c+W0r2jEU3sImHquO7aPYf
 vvwN7DVYF/nl8xUmIekgrezMV5pKmvz3wr3XEuTLdryHK0pxmO/7UagGh7n8LIYIShBJ9zSPVRJ
 A1x3YqX31ksZm1YQGot+3wyABkw7lSFhIKi3v94nbrtTsuXuby0xjFRQSui2+NQJO2TsWdz5hCe
 yphIFofZcYBvsCLLfuHUmR9rLacGkYcx13CTT1ya3HimbCKQlPh35PswSB+zKuTRrCvoptdzjEF
 KKiGZg3SZZ2MAxxqv7DEf3C/3YiSWYMh2YM8Qx1+scA5H52Kv3YsVd0DZwAcZykzAkZAExDabKS
 +Pu3iZnrL5k+c7PKT0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150124

On Wed, Apr 15, 2026 at 10:41:33AM +0530, Venkata Kota wrote:
> The following changes since commit f48f551a902b3cc6e6aa8854e533902d3222a0c9:
> 
>   Merge branch 'robot/pr-0-1776148994' into 'main' (2026-04-14 13:01:44
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-kaanapali
> 
> for you to fetch changes up to 052fec7e57523a594ac518a071c854bf5c6070d8:
> 
>   qcom: Update ADSP firmware for Kaanapali platform (2026-04-15 10:38:33
> +0530)

Thanks, merged and pushed out

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1000

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update ADSP firmware for Kaanapali platform
> 
>  WHENCE                      |   2 +-
>  qcom/kaanapali/adsp.mbn     | Bin 20703432 -> 8311880 bytes
>  qcom/kaanapali/adsp_dtb.mbn | Bin 188216 -> 175928 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
