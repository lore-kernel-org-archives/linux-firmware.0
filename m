Return-Path: <SRS0=9cMI=DD=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F31CD342C
	for <linux-firmware@archiver.kernel.org>; Wed,  6 May 2026 11:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A702C2BCC4; Wed,  6 May 2026 11:46:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80EA0C2BCB8
	for <linux-firmware@kernel.org>; Wed,  6 May 2026 11:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80EA0C2BCB8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467ofY31434850
	for <linux-firmware@kernel.org>; Wed, 6 May 2026 11:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zBQ0/M67JYXs/By2Yfwsm2qw
	IqnMpVagnKXYl1tfWwg=; b=bVN6XM4vfN08h13LtWpUmi3rPPtDmsQxFVCBNN2T
	NajdrNGuogBdQ0RqcseGMLiB/T1MFQa89sTRjJpwoV5JjG0RCR2MzIGcT/PnzURR
	AF8Uv7VlmnykVHTGY8lwcbk1ovS2GlG7+iHL4MDDyFxQP7EQc47BM22obERlByXN
	DdTbT4iTf/iFGV/VUH1TQ1lIVNTAtyf4c7YFGbrAdreP7WBDqh96sFDe+aHOluAi
	bj8yeVnHcHcyxfTgylXmZ0dbU60Pi/p1wBm423SUOsRZnd0jvREX7jRDjYtEeV5a
	To7EcG4bnC5R6qAaywceGQ+TufkjaLcmzcpjQzKBLyRiFA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyuqdt5fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 06 May 2026 11:46:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b79f4b35b7so55979675ad.0
        for <linux-firmware@kernel.org>; Wed, 06 May 2026 04:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778067984; cv=none;
        d=google.com; s=arc-20240605;
        b=TIyMAFWztCv1XIKeZ/IZ0yYdt07S1Sx75qFSHG3KqKQjUajc+C/XReKxpkBCme9Loc
         xORbLsndoDhq6fp30PRrBpUw4xiQ4k3ZTj+f1ikryp81I4/YCou9oHmOzP7sHHVJ2c4K
         XYcTH6p2vIIvae6T16vEfXiF36jAI2OnXGRUriQoZc1P68VJ3WQB9Px6WmoS34HazaJN
         y2Rk2LYgf3G5F1TSXZpEWjcFKMpPOveXQSweYowG0XJMEWq1e9hO9OAeNuOSxdCJgJXq
         hue1BFr27J+6FBrBmWntjrRimgzT5B/SKEicU9Ab2Y2lOuqF/v6RY6fYzl0X80IxZWc4
         D+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zBQ0/M67JYXs/By2Yfwsm2qwIqnMpVagnKXYl1tfWwg=;
        fh=WEavav4SDZNNTAtQmYWKRhq47Ef0BvWvAuQv1JODCmk=;
        b=RSNo7MuIEhlmiBUuWVIEUNR6bd4PFZsr83y++GqN7iMbXgX/rTe/vxew/r7pdl/O1X
         772d5iYfjI+g/i9Vdcz2oRT1SBNSnnwsn/XcPHYiIivhlkysAuL6FKQcLUK6D/LVZFwl
         zn1jkwXgcFCUfxxHXPELIpwnUOR8s+qiH7wYwPx/XjToZ6kpdpDTfWkbWc/cB9fI20P7
         BqqigM/ksyMoBdi3MonpODw1gtSwTKsRTU39mSAAJ4PGhtFq8qMWKhlY/9rz962GDHVt
         wN8RDyZRLhZvrKN79uB2lOvthSyPjoVxmGqoz2kwgOLwAO1Gfoyh++oPo7VROxUohIrB
         377A==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778067984; x=1778672784; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBQ0/M67JYXs/By2Yfwsm2qwIqnMpVagnKXYl1tfWwg=;
        b=brrSSk5OFlDjpnG+DCrLQ5gfwZzSUYPIoODoS+ISQsJ8CSCA1p7ydZsRxoKBWqPOqa
         FLg54FslgRYEpsyIE/Mhf/mKXwhxAefMjyWcObpdMctMhFF/UKWXgXzI61Ou4gZMFAw3
         ybLRtZmkybnO3NqSkyd9yjfc9dqVyGzFGPoCYXAXEaKK5iz0/3TQ4Yi/406UkW21YNkW
         VnSSAN8vWDX7Wqq2UHhZ9ENqni2qc0d2Q4H7f9tLAt1VVOvcWpLesS7wsnKAJIcp602Y
         aLsRz3ev3ggE1AFRT49qRMa78vGu5ijJraTyh9ZLayU54R5v1Hjp7VwyMA+ufsY1SWZ4
         4HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067984; x=1778672784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBQ0/M67JYXs/By2Yfwsm2qwIqnMpVagnKXYl1tfWwg=;
        b=Pmysnqni0mb4VTfpPMBgt8oP8eKoiYJsj+rOrL0J56BgX4nGyU8qdoKDNnGJINKCkI
         mom28wQpSR5tpkKHUBiWhnNwHPlHMvDoQQ0x8AA8rqavHj8pTHQvmt0Lnq//5uWxZ/TM
         7xHHSWjCwW5ZRWZg+NdzgppZ06oEo87HUExTMfrqChhjiHF81/hmAhVtwTeXJY0/wt1N
         rpPzHzvSeblI3FzsDAhXBw8gqB92L5RCj5nHX6DFr0hSNwKFTzCnZvSH7xttAcZRBFFR
         20njFnRHTkpNTpUbwK23kvINkOU8OcOxUC/G7G2E9MHbjjWZCe/nssu7Tw29utW0nRUR
         Vlvw==
X-Gm-Message-State: AOJu0YwNF/1FWukKkYT40k89rTHVXOj9t5ERgbDe7o7/OpL+nVPq+ZNV
	YziqmG09WQ8B49iT9c+GCDbXZXkdgXmK9tTJh+K9ID7QGNX3CEXixpIBv/WcqOCn2AEz9Z5TnTS
	+xUSWa9MiMHfhrfR4j0uDrUhp0NUYWvamG5fDIPEXcd7uxjzCArWFSfAEQbbz9A44SeS0VBP4fG
	M+fdbTX/07P5ieE36PQQAzD2DyxplUsKeizn+KeA==
X-Gm-Gg: AeBDiesaCKLcGO3Dr8/S1v/buAvhQxhVGGO4HGYKU5zr45exSLup5bqMWpBbJ565HDS
	JEWNrNABujnK64E6REbzjaZJAV0VcoqDU6sj4ZwEUR0XL1OP2+7fPEphVy3If4dHML9mIOtEPFw
	R2W/GRWEy7uZjzSPY4DX27EmIFHJmd2Xdq9WxI2EAKQSwNhx4+viKM1eXvJawkE7Bghehgg+CWM
	AY4J7uhY8KoZpdqug==
X-Received: by 2002:a17:902:db12:b0:2b2:6cab:313c with SMTP id d9443c01a7336-2ba79c105a6mr31136425ad.20.1778067984117;
        Wed, 06 May 2026 04:46:24 -0700 (PDT)
X-Received: by 2002:a17:902:db12:b0:2b2:6cab:313c with SMTP id
 d9443c01a7336-2ba79c105a6mr31136065ad.20.1778067983625; Wed, 06 May 2026
 04:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260506104934.82275-1-syyang@lontium.com>
In-Reply-To: <20260506104934.82275-1-syyang@lontium.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 6 May 2026 14:46:12 +0300
X-Gm-Features: AVHnY4JyWusZM1CMbej1BIlDjRoceyaaACHah_CXke06ONT6xXyspLy2KZ6CDuE
Message-ID: <CAO9ioeVBF2O9sRT+KzMETvYuV5Jw0okj6MiM1sxVdc5j8Pdk3w@mail.gmail.com>
Subject: Re: [PATCH v2] linux-firmware: Add firmware for Lontium LT9611C
To: syyang@lontium.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, yangsunyun1993@gmail.com,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=W4sIkxWk c=1 sm=1 tr=0 ts=69fb2a11 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=VsoTBrLhj93VJjFjcuAA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDExNSBTYWx0ZWRfXyr4LQjtcKu42
 4n8M2ja4WJ8t2YV8d4WUbZFIZXbgsN1yebEmr51bzsZfQLFmw1CUwUP6eD4Xyna5MyyC+y0nMp3
 KJrwGpzxnZi65GQ02tj/0zMstW804U47mklJzIbMoG6k6a9iCsY64yEQRSc1fYTaZAdpwYvTg9Z
 QaAEJoT+QIJZtCtV3p8YRfLwElh943F4RoAMXf5JuVzAtgoocqCUMx2qhbkr0eXalWGX4t/Od9n
 fqjjlQwqqVwGxGsGDq+VNxn0PorLnBFK+49kvqKqbuSFjKFJf6MInxytrCb1yaTvoZP4lviigpL
 uTAxG5gSlXApl54OaNRetw7Y9oQvgk6ddukchRADXvz9Ckt2xDi6buY4UTk+32pr/jpmpGuwUiK
 e/tsoz9N2cAb/YR0mtuyK1HRxAoNNDyNHf828s+N6BB7aeT5t6lBRIJdKTFj/8/o8P9BNkQQWcm
 9S7j1ykR5JRsqoFa6qA==
X-Proofpoint-ORIG-GUID: FpdC0t7C0VA_U1Sgx2ck5tgEiD7bcxko
X-Proofpoint-GUID: FpdC0t7C0VA_U1Sgx2ck5tgEiD7bcxko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060115

On Wed, 6 May 2026 at 13:49, <syyang@lontium.com> wrote:
>
> From: Sunyun Yang <syyang@lontium.com>
>
> This is the firmware for the Lontium LT9611C,
> which implements the function of converting MIPI DSI to HDMI.
>
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
> Change in v2:
> - WHENCE
>  1. Modify lt9611c_fw.bin to Lontium/lt9611c_fw.bin in the WHENCE file.
> - Link to v1: https://lore.kernel.org/all/20260506100242.79276-1-syyang@lontium.com/

Why? The rest of the Lontium firmware is in the root directory. The
driver also (IIRC) expects the firmware in the root firmware
directory.



-- 
With best wishes
Dmitry
