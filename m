Return-Path: <SRS0=1lZK=CC=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F2AE8538E
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Apr 2026 18:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B2C7C19424; Fri,  3 Apr 2026 18:48:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 181E3C4CEF7
	for <linux-firmware@kernel.org>; Fri,  3 Apr 2026 18:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 181E3C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1dm01453175
	for <linux-firmware@kernel.org>; Fri, 3 Apr 2026 18:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmnMNbg5JA+xvtwvtGpoAjK6ZkIhPXkZsb3v2JzaJCE=; b=GeSYFbOZsifI3Yrj
	+On4FCEhTHAo/fKCooX73Ql/oaWqolINbaVS6lvpcGJpZkZakeL2OxIu/+7nQbLA
	aOuRqDvPebJlL/GTF4N5ffDh92ymj7g6uOf3N64TByKxjjbRdnePBRUrij4iAA1P
	omK379CJWYBAp5jyOZ8/Ho8e9x/gucGxbeJLpWzZ8oVWAMnArGzirQobZ5zaIRCP
	NTnlVIiOXhy9x67HfgFxJzNr4CCvJuNO3rAFZapGTwYu8oidM5JSsTFFHOgavEm2
	Ycm/k57d7C0a4qqNQRADmi/JyXSxopkQ7ee9egmb3MH2m62KspMGepLf/bv19vLr
	o46V3g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam99c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 03 Apr 2026 18:48:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so100952661cf.0
        for <linux-firmware@kernel.org>; Fri, 03 Apr 2026 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775242104; x=1775846904; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UmnMNbg5JA+xvtwvtGpoAjK6ZkIhPXkZsb3v2JzaJCE=;
        b=OlwvFVzZ25VLkA88Kpn0z/klZ00CG+xbqQRDKlsEsN5Vh5Q2A1JLytkrQzZTs7BL8H
         RBTxbeWSenQlFD9cQORO2EDmX0Z5xdGQT2N6W+q96vGDIVDKOUjdwmD6A9rra2UjLYb6
         NwMfAj7/VXqoSsgxYb72h+ztTvCRairo+Gk4/jo4UfrZeEaqJS1arTPvXoMMGCaFPKp/
         7oCVAJlRUKMns47pr/vQjHloJJYUOsjJFpKKPlbgfKdUMcS0lo2Ro+qObeUrNogyFBU3
         Dq+mPQFNaQUOFrsKp4K7RXZXb7Ef1+P24BlUDdmH7IT7UHG5wtQJskV5cjyB9CUQdQWu
         J9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775242104; x=1775846904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmnMNbg5JA+xvtwvtGpoAjK6ZkIhPXkZsb3v2JzaJCE=;
        b=jdIK8bM4F5CusGabhBJiuSN8awaQQyd62vhSJo/WKS0qGKDyCSizFZPWHLaAnYKdmT
         KLwEGQGeUe0o7fLNvhrgBNE93GRwwDXgsTGEGbvENFoAUqZBmEEXvHhX484VKp+MA1cj
         y23AS4gnnTShFOi3f/uLO+Dg53aqZFm6kePnBBdj10TgKcG/kIJz8wYEuPqzTRtOkmGF
         OdG+ag3lqwFjuF+HfsJGpArsFDKmhNZyOdkHQoCZbM1BxBTdy3pt75OwdWZ/i1PpiVBf
         PBrg4lBTWn1dd0OxSV7yoLfegdiIeY6KucM1GXB0yYeNbVd6BNRbkIbEMHWKwdEsYye6
         XffQ==
X-Gm-Message-State: AOJu0Yz7B5fUyPf/e5hhDB+ByZpGJJkEDM0sB7S3QVdJehdDd8nIY79y
	MctTL/BbyvsYRTMsLzby8N2EP9Te+QmP3VOCeOpTkArcd02WBx4YWCHchCKj20P1FAf7CZYdbuE
	TfmtD8w9IFK67bTInz4dooEvXCGh2nWY0WiyJQDDJQYMy5sYFk7sTQyTC7d6MksrWMvoSOrM=
X-Gm-Gg: ATEYQzyoth0tW0aVFYjlerKtD02dzqVMwnEY4A8Cp+oZ2H8cvJ2mTEDBKCWS4VNXgnj
	tS+Arjwkyj5u8PhNYxEyDuKJ2D0TpsjkVGSOhpMjq9QHXaZT6AaPZtKqbsmFa08AVguManu98jb
	8R1gpaKUhITGIA8OOoAqnPYm7L+De40HNrwoKP7XN+sL4o2jLPLUNyTAuMLPFAiF9w3tqKZmQC9
	YI0uzgQTMv6v1X1dWiFGng3dMPJwlnedjHRJFWRmIjXoHx7oVliA8UxfdStnhHHFAqax4mihiLa
	olrlw7Drj70GyLCJaK2nRUC5D56sJ6z3aDjE4FJ0ipzg5F2WCgfJX5nJtBL6NPrvrhBR5ejSZ/c
	aR126IVBzUaQYM/1n4K0XsUKq9j7LONsmcD6kHCvRsaRz1SwGZxlqBVzf0JaBXpp34QrXRsDgca
	CwIMKZdoet+hHZX5Jn9g12C5qGjvieP3xZZbM=
X-Received: by 2002:a05:622a:aa54:10b0:50b:49d4:e54 with SMTP id d75a77b69052e-50d6273e5d7mr50867351cf.15.1775242103617;
        Fri, 03 Apr 2026 11:48:23 -0700 (PDT)
X-Received: by 2002:a05:622a:aa54:10b0:50b:49d4:e54 with SMTP id d75a77b69052e-50d6273e5d7mr50867011cf.15.1775242103091;
        Fri, 03 Apr 2026 11:48:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95154sm1623957e87.16.2026.04.03.11.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:48:21 -0700 (PDT)
Date: Fri, 3 Apr 2026 21:48:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xueyao An <xueyao.an@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com
Subject: Re: Shikra Linux-firmware: qupv3fw.elf
Message-ID: <bl7f2s32mihomnqg32ov2uwjk5k3bzdlmjiavbkil6dvq2t6ap@c4jpv2vb2hi5>
References: <a1f342b5-1c8d-44ee-8091-a0ac9b5398e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1f342b5-1c8d-44ee-8091-a0ac9b5398e7@oss.qualcomm.com>
X-Proofpoint-GUID: 17GMwfwY0ziwZ8AbsLOJGiN8dV7qREyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE2NyBTYWx0ZWRfX2mIJvY6ktI8n
 yCvm7khZEn0XqkPV6GLMXM8O6bID01uffNjLWhQa5atdK1XEruVXdNb6EAX6UlH6Gf4j7fohORa
 yeNnGy0Tdigtof6YJoHDx1j5FFnxZpgekmVNpQBdwhfz/mTy/UVxwlDm4JZovOnk2LLploeW2kX
 wPo7ZjEmj5k/SdtHyE7jsosu3NN03r4JTZMr7JDn6Eu+zygiw+Pxshg66tuUiNkv4QEYU0SX/Av
 SQoIDn6GZm3B2Fkk57ZomRvsO92TA/6upbuZQchUtrRXyC7YDVlFcadMDO7ZLyNzqhxJo1GkCvx
 mZOUuUc3j38Nc+pMOVrQxm8up9K3pbdH1TIyVu4ZAgUvo6Q5GNFvg/ZIa4bSL7YG5yFss5G5Rup
 5di+7BkDuD3NE6wj9iWK9pBRh3ALKYPxQHf8uf8OJ7goR35rsayZVj/k0sqlC/B/smeBWbPY+V1
 wu2PwifSjcL0mJy3T8A==
X-Proofpoint-ORIG-GUID: 17GMwfwY0ziwZ8AbsLOJGiN8dV7qREyy
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69d00b78 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=A-0ANAbjvZ0rXsIMRF8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030167

On Fri, Apr 03, 2026 at 05:51:16PM +0800, Xueyao An wrote:
> The following changes since commit 583d336ee7c2a15fd9e92c223b147d30737ec04f:
> 
>   Merge branch 'intel/guc-v70600' into 'main' (2026-04-02 18:58:02 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qupv3-fw-shikra
> 
> for you to fetch changes up to 461b77109feca42e38bdb0745dbcfd1bed63825c:
> 
>   qcom: add QUPv3 firmware for shikra (2026-04-03 17:03:56 +0800)

Merged and pushed out, thank you!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/988

> 
> ----------------------------------------------------------------
> Xueyao An (1):
>       qcom: add QUPv3 firmware for shikra
> 
>  WHENCE                  |   1 +
>  qcom/shikra/qupv3fw.elf | Bin 0 -> 46600 bytes
>  2 files changed, 1 insertion(+)
>  create mode 100644 qcom/shikra/qupv3fw.elf
> 

-- 
With best wishes
Dmitry
