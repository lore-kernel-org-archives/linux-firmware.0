Return-Path: <SRS0=l/g5=GZ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9907C61DD3
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Sep 2026 12:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89A261F00A3D; Tue,  1 Sep 2026 12:33:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788266021;
	b=mL3BMWNEvklmcS23jj4OZVALq+i4AKXU59FHEYg9bKyKEdUmgAh6RZgVW9rahPpQl+0e
	 4e351VvcS1vh5fk9KRwN8G0NCjLAP2H8OzDqMYZARBv7bddacHW61829fvywhMb2GNwBQ
	 ZNdffY6LYzKT7kio53CuNcGxJSqlvn6HeJyxwjWHLbxlkewzqyBeBbzKTN3c7eErG5A6X
	 CEFELcojiqg/6IGDPWAKrCmamB32k4w15ntwVqLrvkU3jHkJJPTkwZhS6vjdjBn7+fpOL
	 h+jrJhzm176pl1yQ1uZ93r+ep2lasi549qQHv81rpMEv+DwxDUrUoTFCc8smhkEtiTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788266021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=;
	b=D+UUv1d3PWVzMFr79dvDJd6uuz+ht5+VShFBOrBoQ3lUgGrIUgAnC7fFP22skn0FRdYc
	 5Bdnzr0BCqhy9vav4kWcwRiN8BCRv0r02caDeXYFiFKlfLYFdJlW+lf5pJeh7KoW2cqAi
	 BphDacSM+rQWS9e3Ht5POR3oukCFZOBRZM0JQ/vp5cuW+b9MgIMDVKJTk15EX/iGvFv/C
	 QPolFM/+SsFcbRPtrFLbDJQCTo0qCI0xkN9BRVm23vYEtq573QIK4IIUsNKW0Ag0A9Zwu
	 9g4CCq2nKX0PLuA0hHe8r6mk37kLNdL1d3VtzPwF/1Hz0aZMhEVbF6wLBJh/IV/OoYQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eWjZsGYA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aFaR6/eq";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BA451F000E9
	for <linux-firmware@kernel.org>; Tue,  1 Sep 2026 12:33:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eWjZsGYA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aFaR6/eq
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4BA451F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJZ6i2323289
	for <linux-firmware@kernel.org>; Tue, 1 Sep 2026 12:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hMw1bZsyl/wsw6eXPmwKbIq6
	QdTazM6/t3F4X+WUBco=; b=eWjZsGYAZj8O5JUmFfCnYfRbww3oq3NlVlYWZXS1
	cqUsAhlg3HoZjGzoS4YlzLMgF1qH2BofiuocRfwAFFr3Y89bl5dAgkfB9TEwQAlg
	Yfykf0OjnTmoOKrma0qRTi6uKbpqgHIeeT6QcbN3bKXM/IbnA46+RaZSGloloi5s
	kwl/tWFfr3cHUXJ2CgyXJEU7fM/+8KmWY2LJrjaUvJ8fs3l+LKcjcMSVTQTJQleL
	63qY5ZqmFHMuDZFEU3nOSQvkU+whOZ0Zc9y4DoJvn8CbQj20Gs2J+0pGlPG7heoT
	cQIrBuS0MhrVaGhwS3xy+kwceHv0oAitHo8EpaPNr/9sNg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7cadpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 12:33:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cdc69a7b5so71779966d6.2
        for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788266019; x=1788870819; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=;
        b=aFaR6/eqCBe3MkU8vTioBcB0AdvVqrZloGSsYm1sF7fjI7dyrFXfKnYVZKBCPLuObS
         O0Q/LjjyFiBYmcGHhBNyE08WqRNnhngbmsUJtnrEF/85bgmuL7SpulOQCLCrC5ueBqJ1
         ValOINkwhbYIKn8YdfEQPvO9/tJd1kmlkod7c0JtaKHEhW20JIxIPlyr73Gg7jqaL61d
         mj8/C9HouCaYkKChzK4vA1HfZKKlCl5ITXE6YbG13Rdx34tKAkndRGf1Wyk4cmOvgsT9
         G3l7awxG987Kr+P+P9LuspXBwob9Grxrk+3b5QefYU3tQBOWxk/fr4btIwNFKq6bgewh
         o1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266019; x=1788870819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=;
        b=AqGxWYoX/rwwsgq6KOToJ5eWAnPyqdjsm/Tvq5phhU/H8KDjuVN9ynl8ClthKn00HO
         tL9gUkV2yhVM2tf9gfrlCD26VPUvdr0Ke0AaKCJItxaqAuOf3MtWN7kaqzpUlpdOFFcB
         JTZMjG9y1xw8hOslylFlEH8jMnxQNmIObGo3rHsIJDV/dyxYF6bzwFRgD0e6ZwZtgLHD
         gAuhKzyZenU/zlWO65zpn8LNFgJVayUd2fOsCuIM/YlotLuc9cyER2c4VMyijU1oQA/A
         lys6V/c7AxTNh/PI9rG/TfbaYob7wZ9rDp09aGHwQpNZ7upjEJgqYDhsqLwwn/pWH+0Q
         J4Qg==
X-Gm-Message-State: AFuF++lsoSxz8Cxg+EYnduK4uhDwSBYJ+Dx+zFAQGKPcyBj5+1faki5T
	KlSKHX3YBGb+VU4ebIFJ84ZbA2dlxaCU71QoGz1rlfBpY3a6ZBTq7jqxKOTItGkHVAYE9Lk5QiF
	WQ6bSH1QEdchQ8erkJ2d25LtLWnhI1Dmc9NbfVaeIoIgOmP0eNMvc3+PoCJ18vvs=
X-Gm-Gg: AYBFou3dWuSIu9HFNQBe6yu2GzzddZZn4sSeTHUaU4d0n8KX5O/tBZmbxjedkyG1S8T
	nKXUjacAPFM/EKaATqr1Jm+IzT4VdD17OxnsBa1J1pt7VesJxJ/45AiDPXGycn9hgseXHToKm1a
	v2eePw8T3bxYEpPODrCd9SBnV116qL2oY2eGWMMpEuICiy+2LWFiJZ6GkjBIHwhAWaxm42dxCR1
	kKlFs5LPUjnjh79t5EnNs1jh1Vt6extpRw51+cVjMCzzC16FGFCYIlWOc4+bHanuDbNKr1iY6sI
	ORNdtpXk6yh6W4netX93n5r2zWK7HEYUhlIOXoCFf5TNjONaHWLAoQeOQ5KswFeS9OmvUNaDZv4
	ZZUD1sRYgEklxcIffSHJnbGi2H9Cj4CoZCLOfJDlITdTC7DdVviQ+JTFrh3X0y+Lo8R3K4WEH7S
	PysA2zVvJ4spn9
X-Received: by 2002:a05:6214:4908:b0:90e:976d:fd2e with SMTP id 6a1803df08f44-90e976dfd5emr49205756d6.13.1788266018592;
        Tue, 01 Sep 2026 05:33:38 -0700 (PDT)
X-Received: by 2002:a05:6214:4908:b0:90e:976d:fd2e with SMTP id 6a1803df08f44-90e976dfd5emr49204746d6.13.1788266018042;
        Tue, 01 Sep 2026 05:33:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31e5fc6f7sm16578891fa.16.2026.09.01.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:33:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:33:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260831
Message-ID: <lh3sniuz6oxovkjdhdrjmjmoczjx5y5gnxfv3lteq3tpmjvwpr@x2n7qbbeqnnk>
References: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96c623 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: iBFHn8BI9PEmzlP0N2L3NJlGP6QLR-ED
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX4y1s0CA8skF2
 uir5Qjc5FRi8iZVTNU/NkR4ZP+PTHITAKZ/Z4mwL8bj8sojhcCbYAUlznDa98Y9DGQpZk3E5uiu
 q+GG/B7Nq3WPTkwraKn24jnjJ6CWCPQ=
X-Proofpoint-GUID: iBFHn8BI9PEmzlP0N2L3NJlGP6QLR-ED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfXwsrT2nUNIjAW
 BYD79WdwZkwngiimRhN0or84B8mM953SrbS7Z1eg2i2lEjv/iSHgk9xiz58XUwjd6Abjh3KQn0/
 Ij9rpUTY/M6V4qtjqrNZ5XJxSmGKngi7gH8MQ5ERLUdXEzXloZmrGckfoY6Y4nJoGj/T16EMXNe
 afdVzFlYA2TAEd05hRamY4NLgG6cRKd7fI2S3WbMvHp44JDEkUBHigCf48rvTsFmwsCJ4W91nEB
 KyEfXVTg9/dCoTx9+OZikqDEvlu03mOVPd3ignilVgG0phWJMVPiooXKQ+GK//rXDf4r0am3zsT
 oY+V8uiOV69LxoVQ2mKLmgdlKCLaC9+rgwyyXZF7mojo21BAMgtvAIKUkpuOoknZ126G8FmMPw3
 YBU1w1/n7MLPuYtcsl/5zpQLFlohgX5uBw0pl8UGexBUhKtqCFQgrj0OwJRxswqngA0eiuhISSo
 H/zxq+SF8JIxhEM4JQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010111

On Mon, Aug 31, 2026 at 11:49:36AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> 
> For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
> This version enables Multi-link Operation (MLO).
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1211


-- 
With best wishes
Dmitry
