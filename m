Return-Path: <SRS0=L8DZ=3H=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F89CA0EFF
	for <linux-firmware@archiver.kernel.org>; Wed, 27 Aug 2025 11:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66415C4CEF4; Wed, 27 Aug 2025 11:53:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B7D7C4CEEB
	for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 11:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B7D7C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kAaY031161
	for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 11:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZMYBOoUuE3wta/9/ePg07Rc2AU4dsKotwAYaqLtKcQ=; b=AptVSchSaik2ArPP
	RlnDBire9ELi0fhJ8z4vny5Hjg0mU31m/iea+5SgZKF3vUrTEkbbC8fPeC/RZyix
	BhL10UySGL97h8yTAnZaYzELd1j207fjd+gy1ftmkmTRnVgcQeXPm3M2uTJJEyal
	HUq0kLeg56CmcArlTDJkajy0mtZYlF9h6b69GJsHCXkBxo35Dm8b6j3LPkeh7PSs
	If5jgq0rsSl+NdE+qnKjOFKg2ZO2ZRopw4NxPKLQmd7a1hmfht4XYYBfJCZXphlv
	G5O1Za/CHahQjFh801GhX8OvU7hSs+8NZ3AcyOmYoWllKFNuuvw7cDnsiJbIHmE5
	eA4eGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615memf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 11:53:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109be525eso146092521cf.2
        for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 04:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756295587; x=1756900387;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZMYBOoUuE3wta/9/ePg07Rc2AU4dsKotwAYaqLtKcQ=;
        b=PPp213etVvTlGQG7/7++uBjsDxPNsrE78yu3iwLWPJH/c7Kqqfikra/zY38hCtvfpa
         g4jZcicF3wvATopGW9IKl8Hap68jGjVagCNrHak8pyLF27DAbl/ypeldSCM2oi3S/sCg
         ykkWEYRGQcM+ax1vGKx1ok6XHdA654OTh33LmaeRMZpTvMFKUbEePALT/zoczYv0EeOU
         HQifRIIEeJh5Zq8RZbMq8Go+Dfle8Pzb7+h2k00XJOrjNYDOxwMHr0ejDGKC7H80pq+E
         SCHpyeKcogEfCfwOASDj+QeDtgZ6wwKHqwqOKVUDuVe681NcXnSKLlOwnynclk6hvblQ
         K7GA==
X-Gm-Message-State: AOJu0YwhqWz/Zb9BOhIkT0idavkGHn6WNtB98/bt551csMQKsVqRCsVH
	NKxCifjePAWDeEzf3v0kOrpWXzz9ClemyZlZ2FgNbvev/PRhed9kw+NeQfEA2FEHAM7OLeUjmp6
	X6zN5OAQLkDXwWmp8Bq0Eh6gyc/rcL5sbWcoHoyscyT7oxsJIqzYpoZ/ThpHoTE4=
X-Gm-Gg: ASbGncskSaAuzb+avL0N/uAqgc2jfR9nkBcaiDosK8tOHsBnDQiyI22OFEw5ooS082K
	TzXh4UccTKqJE0cfxcmMAf9AVtPKOVmzCZzqutcPUpZdMYl5bLE6XQQCgZiNiwi5gT/srr/dgkw
	F9CplSmEQsqsPRYgavmRy8LQfWjhjLOlpmDknslTT0WBn/GJi3cRDeEVt8TCtWu4byYI4Uw38JY
	0xCqgRepItm/3CE68O8KbA4C1HYlfVA1z9bvlJwBo/a/shTVKfyS/IIHC88ubF6EwFwOQzw52v5
	9x5YwDOie2jj+7MaCK11m5T92S4oScVBDKmLzz8UDW2utcc52UrJgKCcX1GADUS//km6p8g93xh
	U/bcm2Wuua/BYdYEs49yC9AGPiQHUCOZmoupJ09F5soMDTQdZeg4A
X-Received: by 2002:a05:6214:4101:b0:70d:dd8a:3fba with SMTP id 6a1803df08f44-70ddd8a40e6mr32950846d6.9.1756295587275;
        Wed, 27 Aug 2025 04:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgqNs2W5bIhj9uL4e1sQlttSBJaOlAr2tiw+odVsy1BMeLGQvE37C9qSp+MJgofyfQGfRJ2w==
X-Received: by 2002:a05:6214:4101:b0:70d:dd8a:3fba with SMTP id 6a1803df08f44-70ddd8a40e6mr32950386d6.9.1756295586574;
        Wed, 27 Aug 2025 04:53:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35ca72fbsm2769859e87.147.2025.08.27.04.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:53:05 -0700 (PDT)
Date: Wed, 27 Aug 2025 14:53:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add ADSP firmware for qcs615 platform
Message-ID: <cdajgj45c2nycpaprilxq55ke3lgprybsokbaf77apoivdocpw@tea6azhm7lq3>
References: <783737b1-05fd-41ad-9bbf-8d0e601f3b08@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <783737b1-05fd-41ad-9bbf-8d0e601f3b08@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfXxHME9Y74OsjG
 JBzAmbwPFDAuVxqI8SxM/DiXclr9mmHjR3STjVstWIT9xpDhj6iHRI+24AMCLL1td8Pp6VMWbDC
 kVLCCLt3NKMlRPVwQwNyh5xZ7VYk5IwGd6fCkEgjkXWV/EnP6uGDtZnEEbRuis3mrvEBtDeA6ML
 N31xxYs+Zg7tuyAO6uAUR81IkopQmylLDBECls3YLbtXeK9/ksGamRdJWKLncM1kdumyRW22vUW
 KQmjnFJAQvUIWUxMZXYs+DtjLjNuv3enJ/mAxc1b5geCxGLNt96eGqxjfmRuWRe8mhNODA5kvE7
 48R1B3o2K5Jg902Tg8KH8C5e+56Ga7Han8bNUU8ogE1mlkalSomtenCtX9gtOuGUFVFjm7/pXt+
 5RbPhDyD
X-Proofpoint-GUID: NqBtwpxpZrm2X10XB1unW-dN6nZVUV3t
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68aef1a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=kLl5U-VyUHYcVWb4_3oA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: NqBtwpxpZrm2X10XB1unW-dN6nZVUV3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

On Wed, Aug 27, 2025 at 10:57:12AM +0800, Xin Liu wrote:
> The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:
> 
>   Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qcs615-adsp-827
> 
> for you to fetch changes up to 542611790f77a67a6a24c08d087d22585caa5ac2:
> 
>   qcom: add ADSP firmware for qcs615 platform (2025-08-27 10:46:24 +0800)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
