Return-Path: <SRS0=KWmO=EP=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0650FCD4F26
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2026 14:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D79231F00ACA; Fri, 19 Jun 2026 14:03:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781877822;
	b=aWp8m3gMTMFAStuTHgMujWlQtuBezGLq7sJbnJYD6kLPsTAgcAm8+c/aTcAIyAxa7tRc
	 5tuGhtlAzLG1qEcrQRup83bHwrZ6/IPjwALvF3BFiOMG4Rh7O1dzQjgo0lclJ4CquWz7Q
	 8pYTeq7iOXBZFJqn5Z6f7QzRRbl4qYxcRYIsNuKQvzyS6CzpVNd1FUCf24NlgK/DutRhm
	 uZi6k9kYvaTVzA8dpwT0iAcvt5t1oJCp4Iw3ql+v44o4f88y2Dmohkzpur/j28+DmEK4o
	 TcTYT/22Y3M12aDX3S8b2lWwNRYFafT+F1fi0TQFHe7ipqSnieSosddYV1Swweceg3w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781877822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4XUdn+TsNbjPuBQ7f0yybl2jL1Mt+s77UJf21I/MiVs=;
	b=N3mKknCnZCDLskAZfnndJ/k+jBz667V//iHyrGiIX56tTXf5nXlzlIH0YAiWI/qVrARU
	 I8XM1Ovt/F7zWxgWHmizUp8uorAhQGXjn23EygK5C/z6q6W2LNhyHB87kye9B/eUihcrj
	 z5ajkz4I43Wpw+y3X2O/OQ2fG/NiXTl+z+fn9eoh10bQTevKEMX25XGkHTeZLk5sU8UHD
	 2PVh4U9yK/rb1sJ9VgAAV44S76dKZiHZ+XEqqgH7RJMCzyA8+rMu6nTHrqu+Yz/4D2t7Z
	 BP6geNjyj64YxSqEZtevxH2UPeGdPpfbbpo2l49omigpPfjCN6K3gMqLrk647RVYarQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IDuReNpk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqD2tQoL;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22B241F000E9
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 14:03:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IDuReNpk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqD2tQoL
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 22B241F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDC0GS556576
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 14:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4XUdn+TsNbjPuBQ7f0yybl2j
	L1Mt+s77UJf21I/MiVs=; b=IDuReNpkByGgPk1knBo/+sWmG87z8+nPqwsxYTPq
	d/fOPklwEtSJgq/PIEq/MZWdMM5rqyR96f34gErKpH7Gm6p4ioH2zNtgRG7DnuSI
	6+icWc19b9c2gltRo8SaLSFl4ony0OBErOD5kNzbIXAXOHL0L5376gDZIKoigWDf
	wTxDQbV1Ag1fl0fzeaCv7H4x8x5GHl9iMd1Fy0uwshnOCuQfoQuiXwVI5zRhEBNv
	prIvMc+I85tXHrEljok4D/96vtbGkk46opn972DpPO80GQHCmbhKyPfVkHtNla6B
	yGqERtjQu9p7POWgTykEi3K7TIgx8gFDl62C4BbW6AlSBQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyuu6aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 14:03:40 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6fd5f007eso3963841a34.1
        for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 07:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781877820; x=1782482620; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4XUdn+TsNbjPuBQ7f0yybl2jL1Mt+s77UJf21I/MiVs=;
        b=QqD2tQoLOSCq5UoJ0tfSmvHrrWzm35/IczV16zDY1NwTbmwOCSTqOE8Zx1zdamDqR0
         XuJhaoNE8mM6OT3Dd6Mv72Ypc/ALYtzzOK3D1etF19+H2uW9/dpKETwLvqla205g6vs6
         a4WSKPp2AI1ugHcNGQyZFKAZRVvqQcPkojA31120KqnSWvBJ29+GyxsyeVhJ+/tTDbmU
         PY0tDDzOOyU+hui9Y0NQrtfEUmbo7WnNebA1ZicbC7pIeX+kiipksJ35iVCZnomfREqt
         2DdPH2UsJHM8N7Bu3WItyNkHkLxs9xr6V7qBfk/aCrkR7kq0xq97oUGGgBSrPGUcJh0O
         6NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877820; x=1782482620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XUdn+TsNbjPuBQ7f0yybl2jL1Mt+s77UJf21I/MiVs=;
        b=eNqMeVSLg8vBCZJ0lBxj7D4q5LeTqJXTnqY24ad+/GVlIjJhqNX4dLae7nlw3EPBqG
         mPa1ViFf6cZaiDQ+kPLlWb343TLETYAOWoYDHkec/UblS0icluM+emxkNOD6YtFsl0+L
         nqRoq25tlIXC0uABKEhQC8RWPPC292ZxOnuJXE487iKNEe8fEFBQZIkplEdyDIHNDDlp
         Ml7HUHTytssUtYdJYNs83sCfLey4cj1lHpI9gNWfCuZW8+6CeJNYQINfasZxyJAJsb9P
         vdEVYuyYpMm7TyHhn2z7VaDwp9mit99uOBNsaWvjHRhrqfTLHmNXzfI0pwD9pkZ/qs60
         uSzw==
X-Gm-Message-State: AOJu0YzlWCyLgiQ6sAj+3MTt0Lu5iuuuDfrdlYXtboSTzm7e4x4Fo6dX
	AeqgJ6JGsJpwdgm/vhUqxjQmJpd9rBrlhBZlb3izw0rYSirH6qZpUbhSCQyy62a/e5NhZUYoQA9
	4xT1kP6E5/dDCE1bmjqIWzFTFdO4TqRObmYNNmLuuk9Z+dkekNWn4twNkSQoo34k=
X-Gm-Gg: AfdE7cn82uwVHOsJiQ8xxFzLA5xbSGBmidmO3HwAo+iroO5AHqBE1MpTbv/+v8d65B8
	S6JwLLjHVWe9nhYnP2MoTmY1PgPSNxS7cOt3qCnnnRtzHywftDCeNJo9Fv7KJ/DMthb3+QPJuZv
	MPK1D2B2LgGUIQCV1tvBZLkiJaeaVl7EWpRii6ZPVz5HVZdLnLreZXqUSrse08zV6Li7ZzvlLY+
	FrjESjzu2/kq+Badt3aZ8xTL1yH1sGAo8DAK9F0N9256D7pznCwkmpOvVazi/qsL0RykRjZn6Gr
	2LQNvPq4yg6IUFMbL2tn6WjB/lkcALCO98H16Y8G9dxDkiNYQpKGvbSUNmoxms1HzXL78uQ8Egm
	zeU0ttCcT8rprOUssoUZMgewWtNY1kWX6/nSHw4rQvEVJcBp57p+/6fcm3qG/FDXo8aU7fxzz4N
	9/Tx2T6AIfaf/i84JhNFfyCHM0
X-Received: by 2002:a05:6830:25b:b0:7e6:e7e7:84a with SMTP id 46e09a7af769-7e92d093ee8mr1519544a34.14.1781877820156;
        Fri, 19 Jun 2026 07:03:40 -0700 (PDT)
X-Received: by 2002:a05:6830:25b:b0:7e6:e7e7:84a with SMTP id 46e09a7af769-7e92d093ee8mr1519492a34.14.1781877819606;
        Fri, 19 Jun 2026 07:03:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5749f466sm610488e87.74.2026.06.19.07.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:03:37 -0700 (PDT)
Date: Fri, 19 Jun 2026 17:03:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: update ADSP firmware for glymur platform
Message-ID: <zs46gvwyzuer2iifvkgfmyiavh3gvwjqz7km2eggxegcjnej2v@6xyhdnn25cqs>
References: <8b8eb8a4-a138-4e0a-beb7-9d6052219996@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b8eb8a4-a138-4e0a-beb7-9d6052219996@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEzMyBTYWx0ZWRfX7TlyeuRBkxBm
 DlDWQuqcV5SOSVHARXJrA5gYkkDt0pdlPMk/3MGgmOUQmtGaPArUyH5Ffg3wXhWB7nWmksXfcPN
 EDFLVlNubMkPydApDvunNVF7Nbn+fGI=
X-Proofpoint-GUID: s6kaJRvWjKMTOHPQnUVyAhCYo5afYgnR
X-Proofpoint-ORIG-GUID: s6kaJRvWjKMTOHPQnUVyAhCYo5afYgnR
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a354c3c cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=EwnU_-auADrnrq3yS0wA:9 a=CjuIK1q_8ugA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEzMyBTYWx0ZWRfX31oknV7FxRFT
 HsKuoWu+ItxKUFUmmAIVp/V2/co+ERjwnvdleEktNJyY4fZYzd4AiZmsK2YZs1t1jrzXj3JiOgc
 FjO2vAwxaM/kfE5mMUxF9HkVMpP7ItOJVEevjJm+g/pP7HUNzjm2EU8Q9iN+blq8iDP9F1h5cy2
 vfqiGxeS6jzUza7/eyMlt3saPaylKjzBIIvxg2bEUoBuITMnvd8QnMY5t+oIqAh+5Lp6MttyO8l
 y/bK/5OxUnbj+894U0qFpjtJ02jTgkNOkrv+4Z9odOz6tiPxDzOTy6xhRcr90TlsrDwf2TOc9i8
 k/0mHpfSOvrhCBbrEAtjFgz3VrgXVPFErEA1i5gwCy2xtr1unESb+ij7S/T07+Vc9sZWsL7YxNn
 0oakK8Xo/BXFt6aVwiJVMAgkaunhpILqZEgi5IS//1SWwz+o2rA/x+6u30jk1Cl73+nDHn4HMye
 uF8cwDDl1OLMIgn7lzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190133

On Fri, Jun 19, 2026 at 11:40:35AM +0530, Venkata Kota wrote:
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
> 
>   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-glymur
> 
> for you to fetch changes up to e76f95183c72f1f5902234d27cc2bb11b015778c:
> 
>   qcom: update ADSP firmware for glymur platform (2026-06-19 11:27:47 +0530)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1113

-- 
With best wishes
Dmitry
