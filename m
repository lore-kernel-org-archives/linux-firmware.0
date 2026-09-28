Return-Path: <SRS0=9+rt=HU=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AB9CA5FA2
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 13:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 598AB1F00893; Mon, 28 Sep 2026 13:17:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790601455;
	b=fXZP8b38xoSnnRZ/ljq+48Go6N8tjjMwKF+zN6bG64iyYQsyatxZ/Ypv25RS0rzfu5n7
	 kEjQZLfzfRtOLplJDW9qy8xcEHU9HJkKdU8qYoDru3FbHAIY3BGcQb2EjpaEad4TBbmop
	 oUlnPuno3OqfVqS5oB0Y2CKYCqN5KAFtMlwYJs7hDkcHvvmba+fdKZvgpMisTkwjRkpPX
	 5Abn7oz7Stv4/mkT25mPVzC9QZgwWz+I8nMeRi4SWjc0sWyskn4mOsUwfQ/fph1mU62Om
	 UcJ9CeLPPdJd1KNWQgf9cCl6E/6kt+agMhj4NF6O/pCCVx79CfOSWbcYfBU79WAg/qQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790601455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5wZdS1wU67m5iNCgsLJGK2U6PhayshR013ko0FzXQ9k=;
	b=CSfTK5cXptjg6/jQEDgf7FJ6dJsE+Heg7GA1bjkqQuTOQdMOsv+c0IENbs7emIX0zjus
	 PkaBm9dV6X7InjbRidezZyIrctqzLlFrTeK+ey//U98vzwBQPBZm0YY5rnLoc6kpFuY/I
	 VaYFxCiZ9PpetyWDnXlOJU7GQw5jKjx7hPK9U9Js9Ad2d/6/1/Azg0NfcOocoPZA5N7oC
	 NZsvAKuu/yvM8FKbvYmBFWF/P+OHCEEQ9qCbxltDxKC698RAe8jCLwl/eAT5X9hlIeewQ
	 82Dm1y2o+barF2JZvEx4hgL22Rqg8rrSLQaqTkcjA+EPoFREoIEZaVYyUaW6yFNBaag==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oiYos541;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PloxoHQF;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 937161F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 13:17:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oiYos541;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PloxoHQF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 937161F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAVKa1042603
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 13:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5wZdS1wU67m5iNCgsLJGK2U6
	PhayshR013ko0FzXQ9k=; b=oiYos541Xj/updopPVRJGsY183oNXfcRagRh9N9f
	J9XGzSz6p6aeEml4lsgoNQI2oIq2Sfjbuxbf2JfHUZRWVfcB8qqju+eYWLoN3BXO
	NCuKNQzrTgpVlouP12llpo5pedQKEOv6fGRz7BF7dGjDMM5r+4kRN0YSFmT35atI
	udJDcwn/WnhjN3Z5xD18GJYS4ikqByFLX5ONNAR7RmomP1pYMHSwCpTvekmyvw+9
	oDPX+pf3jTGHuY8wBe7HPILS9AhwoLJYKpsCYHR+QhkJorZ2bTUtEnoANEu0AgRJ
	ZDp+ic4kqfxSV6zMOuiKlN6rDFs2kdEHpk5j8RNcbzNW+w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5msdty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 13:17:33 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9855e11e5b9so2949679241.3
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790601452; x=1791206252; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5wZdS1wU67m5iNCgsLJGK2U6PhayshR013ko0FzXQ9k=;
        b=PloxoHQFU9S/ek/YcW/RLA9pU2RI8H0duBWC+Oa025BMVAR404ILipMubmN21OhLRR
         aV++uBewIYOkjdnZtxsOi9/b5rh8sLcT3HGvq/zAtLol1f5comWn+sib1JouYTV12+ej
         ei2E0LFt2vnkdl9zc21WvgkZpnQz0yHJCTv6/2YcnxIJ78TBY7lb1m4ULgKbiPTj2NLn
         +no+FwELwwCLsp7ymHr57ciR7BxlQyjHB2tdZRB97clna95WKLSl7kX6ko+cF4dz16VF
         K1AN8cZ0QdNpGv/WR0tbE7K8MzhIjfHOYV1km27qb3/gqik4wOdmeYWr/dYkpffA4FRs
         fTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601452; x=1791206252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wZdS1wU67m5iNCgsLJGK2U6PhayshR013ko0FzXQ9k=;
        b=rxPFrbkoMHbadyaeRu1GhwL/7l4YCt+ivx5Jj4GBlLcE4GRHnfzulNbnEhRlQYVH9A
         iYEsMco6POuY/hQvY6gXzg6uLec3mPVBdZer0NHtYtIQSTMGLVMJvUjXmNuKwF2t8RLU
         zeUUSJsTpTfFgcujOt4Eob1yQn2BxCUojnBObMSrL/wBRmGykZxgZavfBSCrLhdU/8nQ
         f4HXDufql0EAY7lBO98cFFr7ElPytzU/RKqMpJiaQkV2TAbbsWCN/OASSmbGChl+SO3v
         Tqny/0vap2y5CgSLMd2KkooZe8i0lFspgSn0FXMnPvIjn7vwSDMjh1WW4RCNjjKgRW+d
         i+Eg==
X-Gm-Message-State: AFq9FYKJ9jePwFoVS/zlgIibNEGR6d5puwnhT8QePMS6OtPQ6rZge1tY
	vlnoYT5ifIRztgsAMppjRHI37TFY0MgpldBIrzrvexDA52GDe3pmQD7RD3WWiu0uVdXVZA8OTsf
	+NWLBELpjmi0VLckVDTPVAyift0ytoNyS45L33sq4UTlXAikgneCWtmzFc8ha+KE=
X-Gm-Gg: AYBFou08TPcpa7MxryFUObXsBUnHZUzQ3RgdrLp5l7//oSZviBaIfBPzmHNd9dIRxtC
	//OYjyXkWQzLB/OdtaNWqMgMeEvToENLlxdNZa9uUnOw7hgykv9FSwoodgFsMDPjWnScMi1kicS
	uslMK2N1dF5KJb52+Ss+0NYYOihEXSoaLDFiKHcghadZJCRlwl8vsXEJnUUdSI2Bv45jQe2adtx
	rWB1Z8c87f10yxEEDU36hVj0mRwMERJCfhhxvDn9DpDvXw11YOvrSAf6/o8HkmB9LZUpGp2/NeJ
	wKBQhBOmPSMOqKCDYf/xbtSVUpApckVvsthIpkWgm4uCzXeeXwdVfgOn+qmO+QCPlW73WK5bQe/
	3Ev+SvOYtll+KTRpc9Y4hwhkmCXo6b3V7jiibRhdHrPaVg0CqXsPMNwLG+Ut/0hIP29qJC9kDRL
	Gvyw84QXEZTwGpmX+ldzs9g8s=
X-Received: by 2002:a05:6102:3fac:b0:79b:b116:2c5 with SMTP id ada2fe7eead31-7af1b96e0a4mr5610820137.2.1790601452558;
        Mon, 28 Sep 2026 06:17:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3fac:b0:79b:b116:2c5 with SMTP id ada2fe7eead31-7af1b96e0a4mr5610816137.2.1790601452095;
        Mon, 28 Sep 2026 06:17:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0d35sm518226e87.36.2026.09.28.06.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:17:31 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:17:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: Re: Revert "qcom: update ADSP firmware for qcs615 platform"
Message-ID: <s7s6bbkxiod2obqbv67heg4itf3rjmn27oob77gvegyjonzfdf@65dcqas7k2qy>
References: <b4a67b24-3a4c-4b04-91fc-66865abc0316@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4a67b24-3a4c-4b04-91fc-66865abc0316@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: b2q3wvT6tzYixqKG4bevrhSzdCDG4gcj
X-Proofpoint-GUID: b2q3wvT6tzYixqKG4bevrhSzdCDG4gcj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MiBTYWx0ZWRfXz5SKkQyqSOd0
 KjnIEUoj16n2TsajwbZG/QRyuTuL4Gyf8aWRXhQ5DhFkDRJZXqQWrc94z9oCvl1hzlZMn6gLO7D
 nV0EiAoJp4PZVxwzM+WP5YmNEh9pbp1jhm8fVQOlBDEdXmio3KozRTMVgdm83v+r3zDk61hBWMy
 10TWt5BD5fNOy5QrWrsytDW2LWfxjyNnpMAtY+rrjBZHfDWT0tx4OTS7VwDVNJ5uVahXy/sO+wc
 EaX7tJLqP3hkEDAAwNnNvGHVQCta/4PF2IRarU08iaQVShDM3miEIMI3/WCp0qyIFyox8oFYOt3
 2iv/droXS//ybWZ4J9DP4h+NLEwOotPjqYlGapmgMtCrte0+ekVjYc04HNnzI+RWUbB97zENSoF
 1+tpZpZzOp9EzVBlbcHJjuat+H2+4igI64ZOhwFnL54ZtJjCyHD0XVsUTxcY7lmVa4sTRVEbRZU
 OCnP4txqwbyRcGntIsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MiBTYWx0ZWRfX7xWj2fNI31pz
 yrAveOudbh67D/e0BxaHtB1IFHyG20/yU2j4ffvdZz7wU2d7dzDwjW8WkUReI8/AcjDA9wbVX2U
 zWnYvxpGNWi8/GZbqzEAg4gXQaVfj9w=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba68ed cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=p6TLKQ3cXoUwcxhlL7sA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280052

On Mon, Sep 28, 2026 at 06:12:23PM +0530, Venkata Kota wrote:
> 
> for you to fetch changes up to ab0861c5d22732c7b2093f97f909dc82591ddf23:
> 
>   Revert "qcom: update ADSP firmware for qcs615 platform"q (2026-09-28
> 18:06:46 +0530)

Thanks, merged and pushed:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1280

-- 
With best wishes
Dmitry
