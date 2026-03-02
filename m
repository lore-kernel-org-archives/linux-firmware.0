Return-Path: <SRS0=F0kQ=BC=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50DCE9B35E
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Mar 2026 11:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90B67C2BCAF; Mon,  2 Mar 2026 11:03:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDD01C2BC87
	for <linux-firmware@kernel.org>; Mon,  2 Mar 2026 11:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDD01C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62288QcJ3223966
	for <linux-firmware@kernel.org>; Mon, 2 Mar 2026 11:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4tpWM4TF22pajXkL5lbNZmi3ld+elMpO0i78j2Dt64=; b=oCGjNftudVErY+Fx
	fycoK+5GUOodK3Gq3jPLGu2qOTzJ3yxkZQoHguh39Sl1Zsese6CC9jBva/nBtmrj
	puEy5I/qrBfdFV31AI6Nl5Ofwspvqj3hcre5ZhjXiJ1QIwZWdoUpM9oU92GR+vFm
	UuiWrHSGSUWEcHgys1CSmeywGS6sNpUcWxBnEONCAq+EN+7tb+crUBkNpkPZJnf/
	60PZKUalKK2RJw82HEF83dWheXpPk7JLWaz9VbGNzkzFLBKDzNHj/29OVmoC+mRh
	AGFOrG5nwmkWPng1XxEy8RjamAn4gDe05pI98MFsApHxLZGO98hWvRyzVoWm8JtO
	H/MwNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1hv41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 02 Mar 2026 11:03:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4a241582so2949565085a.0
        for <linux-firmware@kernel.org>; Mon, 02 Mar 2026 03:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449385; x=1773054185; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S4tpWM4TF22pajXkL5lbNZmi3ld+elMpO0i78j2Dt64=;
        b=WYRsPRimVMlUxPgfM2lSXT/9tVCuicyybfJs9hgkFpGgriIQ0ze/k/kD/8FR+K21Jv
         nneQ5VRl3kvULPFaJtqzM5+3inb1TskdH0ezw6GHbSFqobnoB01yC0zfRllEtdIjVecd
         mokK4yAsrJLyiQgJa4K899JuIL15PCWTP48AwPgHxUYrVVjsKtYqd1bdQ9lQtV4eRK/I
         j+8KXB+WYpynKSyovJOdsY/Dz8Hf57CgjDwdCqt9VH1K6FtfC+3tBsUi+4D6NWtYz+8z
         zxK8bjTQ8v2cbNosHKJRpUR8LFVDbMqbEFn/rocaW17QOrflRggM6KBRjHPN33V1SQTP
         RS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449385; x=1773054185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4tpWM4TF22pajXkL5lbNZmi3ld+elMpO0i78j2Dt64=;
        b=s4DSazO0SO8wo2IGtI4QM5VGatVbqykC63BSmSewIAxHDQKiD68oV2ALK2wlVSJbQV
         0NVicJHthgUDDEMj27mM60Wig8Y9rDIIbCHEXLtHGWJZ44falbQGlEXvw1N1RUS3aUxH
         NOZWZrXRW/FovLz5Gnc7Ftc3/WJcftjJHXvBOwBSGMJU/VVE6uilQQxd1vWKgdO2a8O0
         F+/X+1N/+xXeB7s4VT0/r2xszUZ0qJ+mvBVDNbz6ZkFf7Is+CRN8HfxTUGMO6wmP6s92
         4XsQyPpOZf50CLX9lqDipyCeXV1Elbb52wMJAitzqrBCX24oJcU1uophA2rHCUmVjsKR
         phow==
X-Gm-Message-State: AOJu0YwOD2nyxdInH+uzeJ5PnsprDYUQchZkaAmtJvHRkx/RzH+qaiWk
	o7x1qN0C1KpYQgrMtH9JVXxut1Tv9SkBspT+7FNfY2E1IG/eGFXi+X0qzZmDRn5nXWUl7aNUgg4
	/Qh4PcSshGz6+EF2lxjBB2KXU3kXhkpyxJFOnoVc9m9k/qrgOxS+l6k5TSfGH4d0=
X-Gm-Gg: ATEYQzw97KIg1KjXKWe5DlHjgZ40+TEQleO7p8Op7lrVegbzKBzQmGATjTp0p+ixmWd
	MehRB1EfMrU3PNIHMKL+jIpLPeo+b7jHiyE0YFPlOhr609vvg8rsGcEbut4ZGkItj6u/aYOSycE
	02R1hKuuYgCwuvrNE+Yb037qJWuHE+TuKdhZJflsk8sbAjRYmJ9OhDY0EuiRQqPjQdpRK7JzaZg
	ld4xea83UzrLt6POBrfpD8+CPuGv3TgYYWO90TQtJGw9fVw6piWNWhE5WSA22BdyWuUEyCorquF
	bysY4Q4huzzn78bg2OwK1N0nCOAxW/VfHb5JjxjjKQWAXaMq4aLpwuI0ROvuyPeTrNY2AmwLRmr
	6VzOAZe57/lxEZUeyzhDseGb/DEF19gjCUo4LBbkyXsiAxvlAoLRoRn858skirKB8atB082evzV
	VVOnoleu67wMKSpiCablmJcVaDfjLWGO5BV4o=
X-Received: by 2002:a05:620a:4495:b0:8cb:5c90:dd7a with SMTP id af79cd13be357-8cbc8dab0cemr1270286985a.36.1772449384986;
        Mon, 02 Mar 2026 03:03:04 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:8cb:5c90:dd7a with SMTP id af79cd13be357-8cbc8dab0cemr1270283385a.36.1772449384543;
        Mon, 02 Mar 2026 03:03:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bce0d9sm1575745e87.21.2026.03.02.03.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:03:03 -0800 (PST)
Date: Mon, 2 Mar 2026 13:03:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: update ADSP firmware for glymur platform
Message-ID: <7mbt2k3gqhxs45l527miwjz4b7zrqegjmlhyi64i62uombffab@4nua6tiy7usu>
References: <3b89cf7c-2e22-4951-8811-ea646c00be53@oss.qualcomm.com>
 <kewyupqb3z6sh3jnuqzecigjx3is4mt26uc5wil5cybd7dzrtj@yaopwhgqdaoy>
 <4c6945ef-e5c2-4d35-9be6-a304c66f7043@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c6945ef-e5c2-4d35-9be6-a304c66f7043@oss.qualcomm.com>
X-Proofpoint-GUID: PrUyfyGV8uDZ5bLdQNskyaI3hncCFVgd
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a56e6a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=duPnH3d3SeAO5TQUbVkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: PrUyfyGV8uDZ5bLdQNskyaI3hncCFVgd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MSBTYWx0ZWRfX1PT2+mC4xldg
 /A9LZOmvJjgSQpI9Y84PXByISRNaKwtDrow5xvTmMJ7FTLtRT25swk9iA/RLgjXrXqDSyQS42X3
 S/diIyMweRVetrjNy1M9BFLPeG0YdBKqZFFbijAz36FIK4ploK3mv3H+kPoCQbLjKZPHY7UU7UR
 SUivz/+bKQko0tf0CMCzgp+ctaRqn8xpLnjiUYs245J+YsnHQchImvrKpKtlH2cjYWUROsv36sA
 YMWI1dOVD+ectsFZTM10hXe8hVNUyommSQ2S0ddJiwu8Idd305SVIzktFHUzhtTj/A/1GS7HE2A
 3xAk2QEo0wwJslTKA+ct/1DCl4At7qC8c03H2HqyHMGc6Zscpbg4g0YTb3YQPGEGGosd0i9/EwL
 reF2sdAPYszMHDZTrABsnwk+/4y2y/okpj5ZeCxcQf7jhUO9CMurzl4kQR6ixUeHVDB9B6X44vD
 vySwVTG8lTTnZgK+ixg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020091

On Mon, Mar 02, 2026 at 02:02:08PM +0530, Saddam Patan wrote:
> We observed a bootup failure in Glymur caused by a corrupted adsp_dtb.mbn
> file. The corruption occurred during the ELF → MBN rename process while
> upstreaming. This PR includes the corrected adsp_dtb.mbn to resolve the
> issue
> On 3/2/2026 12:38 PM, Dmitry Baryshkov wrote:
> > Missing commit message. Please explain, what is going on, why you are
> > updating only the dtb.mbn file.
> 

Let me reiterate my first phrase: "Missing commit message".

-- 
With best wishes
Dmitry
