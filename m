Return-Path: <SRS0=aqNB=H6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033B2CA6015
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Oct 2026 21:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C060D1F00893; Thu,  8 Oct 2026 21:57:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791496673;
	b=fC7bIoeBFZet5RWO7y+fVy8PHtlB3GNjVV7BzAmlhoEYFFcwi1Vmw1fOvoBmGJnodPr2
	 i8xKrXyvljFi9N4X1hHKtTV+ExOAVQlm+Cfq5076PtTOdC+Jz+7L5BKKfo3hYI/7thVG7
	 ZU7QVsiYVL25BYUU6U7rrq6Bx3qROScRw602gaJJGXGuMmFTaHOEmSttYns3lnyl6KwZr
	 qSEDBEHBdDN+SHJcw/+S0BeXjEMBV5VLkIEEZFqAoIQ5KCHsnTIzP48KoGX50Cu8baTMI
	 cdovNpxhrfaj6T0Y8zBbpnYKiYSXzBjXr7aWH7UDIcd8Be1mrfwFQP38EX3ugf29WwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791496673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cVKVw9IAnu76PubEvYRUd5mVJ2bSEw1NDVyHVJ8n0lE=;
	b=QY8bvz9GDq26nh8zVI5Xnl80RcSRSXXoCPOrsVNiGt6isU+gK/Z6ipUoPuEzp9nJzB5t
	 tTy/1LIY+QGZ42W9mUKcHbWY/14ohCjeSOM8brUel3BSSzVvjn/Nh4KNI6ktxKYQexEpR
	 7f7asAk1HEsTfmeczMSP/lcEi9MTf5VqeuYELYGVOEXCmAhaRmnJinlKmxiNOESKdgXFt
	 eZSYWwkTePqMVnjdTlxqAab+eHqPuyt9YC64T+mcYpZx4Sm+SRemV14kxZHaa4FZZkkQo
	 fD22TreC9mz5dV2/sF8aRHK25lvTALsay/18mg2u9vf9bUdV91HnyPvJ2x+TPg3Nz5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oYrdls71;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CKCsfsch;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08B071F000FF
	for <linux-firmware@kernel.org>; Thu,  8 Oct 2026 21:57:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oYrdls71;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CKCsfsch
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 08B071F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0BqX173462
	for <linux-firmware@kernel.org>; Thu, 8 Oct 2026 21:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cVKVw9IAnu76PubEvYRUd5mV
	J2bSEw1NDVyHVJ8n0lE=; b=oYrdls71P6HPMgx7ixB6R7Vb4WlUsS+N/3UoCYTQ
	F2JTpdrHgqywwsBxwqG9Mzkh7GyTKt5ukDXISejgqhJvsHXgGjfY52vELIMN55S9
	/Ro64ETxN2477NJaYHzK7dwrk2Nu+qJUHHO59SwjBnpqKipP826xzhpbc4vB2y9o
	phL/wVUcKUtmV1XyYOEOwX15w3wTb6fLx59sIPih8//FL4u6drzl4kcgS8W6bJIy
	RLpJQzjJU4sRlDgKwTviA0ugH1IQaax4sP4TgzHQaeSXFhpapaxk7yBdyAopupu4
	YannAPC66SV70mlZHoW66Y4KKS1gKxx4VEidbUvY/njJ3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj0rvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 21:57:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc0b31ecaso1257098185a.1
        for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 14:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791496671; x=1792101471; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cVKVw9IAnu76PubEvYRUd5mVJ2bSEw1NDVyHVJ8n0lE=;
        b=CKCsfschLy/OIajLaDuTVX/Xf5Cxsd6d8PI2uzobz71eNjXyOqaUmFSMJMQBEgxbS0
         WsYvUetXdv6tiqRXsGUW0PlfyeZjNnzqdv0agz/2nuVbRBjF7qDWLfdXyN39C+fQE34J
         8xFHKZ6KolVP0tSLJkFlrqjBbxQVyuo/x2Q9BmucQde1OJXeQU5LDmhklQxsFe0+B2lC
         WCxGM7ltT0A9wdjTnhIIGaidUq4NbCFYmIytH8SRro5rgZYU52V1YYN3T1nSYxPGPnZA
         G8CrOAqcebRxmZ0ngiz8DkzIrRNTK1aTpVNdxQFvL2NCRZ3WbgGJBxBzkILJv4eyAB8e
         5Phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496671; x=1792101471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVKVw9IAnu76PubEvYRUd5mVJ2bSEw1NDVyHVJ8n0lE=;
        b=nkDxgir/dOtYPjgG61DvA4kFuuHwCiMnvMKI7se+mmzOv0UX5NwpASJO80s2CkNzJ2
         GexaSpl/5RqxMeUqc/nS3jsDUYEAKgE7fuaWKNQr2R94cuqWwxR1hUIjtNpSxN6xgM0l
         vrcKD4CK/ptnwCVggrcwutosaH8e7gMzxcshJTwxs6eX8PdogxGUUNPh2Tg2u2+sNMV/
         dcuI3GorVgNGxc2cDsZkyvjy5Lz++0PWoyd0hQhDdrNLsnwzX/QgFZaIY2nVQQEEnRjB
         FzCYm73vIXRWeUwIfUFDqmTUw+0MwVvfRLRirKcdGZJX5cmKX+HK466rnGl+OFsBXK0Q
         +DBw==
X-Gm-Message-State: AFuF++ni970Vev7tkoIy4g2H+MZ7AnnZXTmRulkBriisrg7gHXqbFlVO
	M+Oer3Ue3f/7AhVWzsm+ZuSsEqAcw1MM2I1xRyfnK7JKSATyXM7VAV3LBUNdjP+KOUZjz0726OF
	7b78CZPMjA+kiAeIoL6nDz2u4Mz8oN7WV31J9VL43Y9bnqjl5lZCpiCZDuFatJFQn8/1Bl11/sg
	==
X-Gm-Gg: AYBFou00lGhnJYwSVmFkOD+yT2WbYjMUBZ9bYkVIxvv4WcmS6qpcEIAExl9vKSF4ODm
	uqeEayR9QcgB63pyzxf2OGa4zuZ2RMqG+RL8w2HEsqEGeszM2lIi8WxCAuLUXCy0kNY/qKlmNXp
	QLgTGaQtMqBjuEHYlq+w03IQ0mfQLGKpqgSYGq65qPIeiom4cdS689FvX+zltCKicaHflnrTK2P
	ERWpwgf7eMtYPMI0BHZHDqVV3RqAzMqhIXV/ada4CvLIfdwl9Qwb6GGclX38I2xCrjLsHQ5pDDy
	j3UrkGI+35X5GhLa2hAfaj3MZ7DTLnsugtHI7j3bB3NB1sHPCrNpMvMSEkvXm2vNE+eGUqfP8LD
	WvZrc9qImr4MIPyAv9dXhmFuCKCu/W5n+LxC7e4fOfzm9Dk+psyOzKbEjhlfnlFCQAzCiMXid9a
	+SmHoRN70TmsWu
X-Received: by 2002:a05:620a:46ac:b0:93b:d7a3:45cf with SMTP id af79cd13be357-93e9b81e457mr1296749485a.56.1791496670977;
        Thu, 08 Oct 2026 14:57:50 -0700 (PDT)
X-Received: by 2002:a05:620a:46ac:b0:93b:d7a3:45cf with SMTP id af79cd13be357-93e9b81e457mr1296747685a.56.1791496670493;
        Thu, 08 Oct 2026 14:57:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddec093bsm86715e87.71.2026.10.08.14.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:57:49 -0700 (PDT)
Date: Fri, 9 Oct 2026 00:57:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update HPASS firmware for nord platform
Message-ID: <bogjreespb7ntadbtdl5yhbhqkfbmi7edd267pr22r3depgbjq@tth5ymlascdr>
References: <c67f14a6-502c-408b-8f5a-14bd703d078d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c67f14a6-502c-408b-8f5a-14bd703d078d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac811df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8
 a=vyXeGSww8-Bjh3moARYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: soKVWVjdF6Cl1SwReTzBDnc5492IWKuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfX5dD5GTiTFrf3
 N6vWWXQPGlV0kkYm38+qgd9N9Q52HmoNercN8tr3rR7gaZIjfZBzJMffjaWjR+1bsC1GexIniFl
 hGyjMJ3yK2vPIkclNqk41iyVpJPiTI0D3KzwLLI6weFMSK6UUvTdSg03de2UnXaALIm6E8wAvS1
 Vh74oOBVWNMsuEphiH8BVuuyMeb17Fmgt9SJC9enQm4ybNJ2PAevnlTZDRgV9PW7ctloZh/Nbux
 eWTZEky1h0VI6G+F4LpF3oXs4XB3qEg/h9jjlqVBisk12jfmqmuc5LE2wlrt7lxeDjVz2XimAHw
 uqecpozvkVDz57YT8XHJBb0hboGGXrFp2r5nGv3blEqdF1nUkPPYQZeSLMpxp+erRqWExQTbyWQ
 eHunIynDF6HPJzNggcCpLiHOsosF9M9NJJySoer4c2C8GXjThzXoP+C5q5IiigLarQBrQrCvnbe
 66kVURW/G/THOTm+c1w==
X-Proofpoint-GUID: soKVWVjdF6Cl1SwReTzBDnc5492IWKuN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfXw5YeQVoBXYFx
 gky9/dtn54E55PwSUWUszhmYBNNfhCIpNzde5hPx3w4Nxz3jYcS19pft2efvEQa/4P9iKR8iC5C
 4vd0G8WW9SxojGH2LC33kJJUS5do3Jc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080087

On Thu, Oct 08, 2026 at 07:50:36PM +0530, Saddam Patan wrote:
> The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:
> 
>   Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-hpasslat                                                       est

fatal: couldn't find remote ref dsp-fw-hpasslat


> 
> for you to fetch changes up to 898bcf4ac1e4dbaf40ffebe12d56890c4e2ea856:
> 
>   qcom: update HPASS firmware for nord platform (2026-10-08 19:47:08 +0530)

-- 
With best wishes
Dmitry
