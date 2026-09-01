Return-Path: <SRS0=08sE=GZ=jiocx.info=info@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79C6C61DD3
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Sep 2026 10:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B08D1F00A3D; Tue,  1 Sep 2026 10:30:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=116.50.98.114
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788258654;
	b=odYCrPbcsLeevPazrGTUWB7oGFFmjfhFSzlYsGLs1RzHDYCr+9K5bfdFf9fBboSPus7r
	 qm3lDmyRJ3TK15h8DB5c4afu9HTg5xqy2FTpfRtazGp0yzH+KFgFpFj/5vUXjf9tdxvC8
	 pT1Pjwrl7QufsMX7EOU/dCg36FjdqUft2X1MJJwKYM560IisOyYuPc0gTLwEeDb+Y1jWy
	 DZVKVL5hp1ERD5I21EsC4UO+ykq4gEWoAhjeK1IeAHChRandgT+KcelPs5RgrqBfFYDGK
	 2JE5KfpunClxlxObstqVmFM9oGRcXCeMFJ+8kvQLbWlG7rMHDLm1Cr747YLpN2uVWwA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788258654;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:Date:Subject:
	 List-Unsubscribe:List-Unsubscribe-Post:Reply-To:Message-ID:From:
	 List-Id:To:Content-Type;
	bh=ijS5OvRrTiNg/svefEOO6hgHlpmnxN8ZU8ywS6UGiAw=;
	b=KO6LLJkt4yggXuAxDb/J3C5lTpd/8vFJLmNkpdIZGVvmbCQ0/vhayMF43EYOJu/LJrEN
	 sVfxnEsksuV0KWcMv5M4ICK9zJNagHzjtCUY9NQ+Q6MavT0onvSdV9KIh2El9V0eQ1jNo
	 e8EZze8rXKlxjxHH8+TZNLDx0+BoUFjeCkdYtV5EuiNfd5xqYfONtfoEz4g6viv7I01/b
	 kNNzPxQzYpzghh70lb1vLOy7T+EHXhwkf/nDHQ79SvI4gWKVjpB/66O6D6Q8OonfpZbq+
	 jhaLIRKG6tjaK71vDgLpzZ7+7wEhtXAw9BhciOZW3ddvtUW2whYXrQKL1/XUsdyo8Rw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=jiocx.info header.i=@jiocx.info header.a=rsa-sha256 header.s=mtajiocx header.b=TS7Wen91;
	dmarc=pass header.from=jiocx.info;
	spf=pass smtp.mailfrom=jiocx.info;
	arc=none smtp.remote-ip=116.50.98.114
Received: from cmpgn-mta114.jio.ril.com (cmpgn-mta114.jio.ril.com [116.50.98.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with UTF8SMTPS id 775C51F000E9
	for <linux-firmware@kernel.org>; Tue,  1 Sep 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=jiocx.info header.i=@jiocx.info header.a=rsa-sha256 header.s=mtajiocx header.b=TS7Wen91
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 775C51F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=jiocx.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=jiocx.info
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jiocx.info;
 i=@jiocx.info; q=dns/txt; s=mtajiocx; t=1788258640; h=mime-version :
 date : subject : list-unsubscribe : reply-to : message-id : from : to
 : content-type : from;
 bh=ijS5OvRrTiNg/svefEOO6hgHlpmnxN8ZU8ywS6UGiAw=;
 b=TS7Wen91wW5tMTHihvbohohZaWVbVaLntoQUp1PBVXkAEz8l9xS/ldM4X/Da7u/k8gtmg
 XIkObpx/puZhnrpTUMRJE4zHn8JkNhnW7jlvB0Vm9ZQSYkKGE6MSIjNb//2cQhHtVGa8AW9
 PFdCJyB/XLsnvWR+wzmKWsiM0fqIwiw=
Received: from localhost (unknown [10.177.4.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cmpgn-mta114.jio.ril.com (Postfix) with UTF8SMTPSA id 7AF2D6D11615
	for <linux-firmware@kernel.org>; Tue,  1 Sep 2026 16:00:40 +0530 (IST)
Mime-Version: 1.0
Date: Tue, 01 Sep 2026 16:00:40 +0530
Subject: Turn Patient Chats Into Confirmed Appointments with JioCX
List-Unsubscribe: <https://email.jiocx.com/unsubscribe.html?data=f6ljvyyrkcJ4t2wVtgSZM4C5IODlIcClFeUulipLFOvXs3rOOSQYP11L-DI1ZSa6-fKQy6PFESnRjDo7wsTJq_8NGp2E_TwgzYduPmJxSYZfeQqmN_arnfX5M1FpmtBzZy5ZIPh18_5d_lOXo6tZ_L1QlAWx0quCHTobKnWzVu7TqAtCdge1-XKwNx2uYDZrHXCXkofCnUKLs6oM_82gB1Dn7uiinzUoe2QhSQVj_uXB1dnfroqG5XNRFPk9&emailTo=linux-firmware%40kernel.org&list=master&reasonID=0>,
 <mailto:unsubscribe@jiocx.info?subject=unsubscribe>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Reply-To: hello@jiocx.com
Message-ID: <jiocxmarketing254/16536/570046/210666b4-a5f0-11f1-92f4-3e7309ddcc96/campaign/info@jiocx.info>
From: "Harsh Gawade" <info@jiocx.info>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative;
 boundary=cbd5fc46da277f47573dbed1de5adbe4d9120b8d1e3df22b0ac596d3342c

--cbd5fc46da277f47573dbed1de5adbe4d9120b8d1e3df22b0ac596d3342c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8


--cbd5fc46da277f47573dbed1de5adbe4d9120b8d1e3df22b0ac596d3342c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div style=3D"display: none; font-size: 1px; max-height: 0px; max-width: 0p=
x; opacity: 0; overflow: hidden; color: white"><p>Introducing JioCX Pulse t=
he WhatsApp platform for Dentists</p></div>




<table width=3D"100%" style=3D"background-color: #f5f5f5; border-spacing: 0=
px; margin: 0; padding: 0;">
    <tbody>
        <tr>
            <td align=3D"center" style=3D"background-color: #EFEFEC;">

                <table width=3D"600">
                    <tbody>
                        <tr>
                            <td style=3D"height: 20px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>
                    </tbody>
                </table>

                <table width=3D"600" style=3D"background-color: #ffffff; bo=
rder-spacing: 0px;">

                    <tbody>
                        <tr>
                            <td style=3D"height: 30px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>

                        <tr>
                            <td align=3D"center">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style=3D"width: 40px; heigh=
t: 40px;" valign=3D"middle">

                                                <img height=3D"40" src=3D"h=
ttps://jioimages.cdn.jio.com/media_uploads/20240909160451.png" alt=3D"JioCX=
 Logo" style=3D"display: block;">
                                            </td>
                                            <td style=3D"width: 10px;"></td=
>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 30px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>

                       =20
                        <tr>
                            <td>
                                <table width=3D"100%">
                                    <tbody>
                                        <tr>
                                            <td style=3D"width: 40px;"></td=
>
                                            <td align=3D"left" style=3D"fon=
t-size: 18px; font-weight: bold; color: #1a1a1a; line-height: 1.4; font-fam=
ily: Arial, sans-serif;">
                                                Hi ,
                                            </td>
                                            <td style=3D"width: 40px;"></td=
>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 20px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>

                        <tr>
                            <td align=3D"center">
                                <table width=3D"100%">
                                    <tbody>
                                        <tr>
                                            <td style=3D"width: 40px;"></td=
>
                                            <td align=3D"center">
                                                <table width=3D"100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align=3D"ce=
nter" style=3D"font-size: 32px; font-weight: bold; color: #1a1a1a; line-hei=
ght: 1.3;">
                                                                Introducing=
 <span style=3D"color: #7B2FF2; font-size: 32px;">JioCX
                                                                    Pulse</=
span>
                                                                the<br>What=
sApp
                                                                platform fo=
r <span style=3D"color: #7B2FF2; text-decoration: underline; font-size: 32p=
x;">Dentists</span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td style=3D"width: 40px;"></td=
>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 20px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>

                        <tr>
                            <td>
                                <table width=3D"100%">
                                    <tbody>
                                        <tr>
                                            <td style=3D"width: 50px;"></td=
>
                                            <td align=3D"center" style=3D"f=
ont-size: 18px; color: #33353E; line-height: 1.6;">
                                                JioCX turns WhatsApp into a=
 complete patient engagement
                                                channel for your dental cli=
nic. Book appointments, send
                                                reminders, share treatment =
updates, and automate follow-ups,
                                                all inside WhatsApp, the ap=
p your patients already have open.
                                            </td>
                                            <td style=3D"width: 50px;"></td=
>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 24px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>

                        <tr>
                            <td align=3D"center">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td align=3D"center">
                                                <a href=3D"https://email.ji=
ocx.com/web/v1/ctr/v2/he1uJcqWrk1WHc2SO8ejpPrNio0UxQm8fF2WnSWt4AX5AltLnEjTo=
_R4twYio3Svy8zvIERGfsgsc3YMnWmuDddmofw5035vif83t9HB_DqHHpXUgPnJGS_s7EtD_WKr=
-Cx8YfWG2oW2LFGEHwE2Lkc_4-xz6vA68WMAgt4B15MlFA8HMIA0i201cS6ClCGOhqkwYazjp5a=
lwn8B5SBCxyiMVU__YoeLL7DqF9oUL7p2QNZ1VtiqY-CMZAwfyL2IhndDOxbmdHNqLugm2gS0Rx=
6Lb9q0VWUdCyOhx-bC0xWy7QNbXJeh6A2emi2vpUXQvP7hU9wsMyVti0IJxJH2IKU53hO_t2nwD=
aQBKyoT8JouURrYlYCwiRazNm79LLPWdf9h_mkZCAgx6TEXDjy-x5Vx-Es75ceCRYCcxkMBOqBk=
9-zmDnPBr9NYOz8YebQPVRmMFKdivyoV6uKGueIxItKF7YfLW3XPjTZlhGabUQdNmZJtZJArgNj=
EDrbfYreLDnCoYrWycOM-izzDfv_HqJiqBQo5gZXEdn50Ac-mtoblTLu4fIz7gPBHZ7Q-ZZn8oi=
Pz3Ytf" style=3D"display: inline-block; text-decoration: none;" rel=3D"nofo=
llow">
                                                    <img src=3D"https://jio=
campaigns.cdn.jio.com/pdjcmp/image_uploads/7b31c018e20b2908e0b82ef27f5b764d=
39bb0c367c4905b870f9bae27c032b55_1783681421752_Frame_(3).png" width=3D"150"=
 alt=3D"Visit Website" style=3D"display: block; border: 0; outline: none; t=
ext-decoration: none;">
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 30px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>

                        <tr>
                            <td align=3D"center">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td align=3D"center">

                                                <img src=3D"https://jiocamp=
aigns.cdn.jio.com/pdjcmp/image_uploads/61d0080f0d4937246b264294425b0dcf11a6=
702dba2a24ac57648dfaaabe370b_1783672489152_ChatGPT_Image_May_12,_2026_at_04=
_04_03_PM_2.png" width=3D"400" alt=3D"WhatsApp Phone Mockup" style=3D"displ=
ay: block; max-width: 100%;">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 40px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>



                        <tr>
                            <td align=3D"center" style=3D"font-size: 22px; =
font-weight: bold; color: #1a1a1a; line-height: 1.3;">
                                Get more from every conversation.
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 30px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>



                        <tr>
                            <td>
                                <table width=3D"100%">
                                    <tbody>
                                        <tr>
                                            <td style=3D"width: 30px;"></td=
>
                                            <td>
                                                <table width=3D"100%" style=
=3D"background-color: #F5F0FF; border-radius: 12px;">
                                                    <tbody>
                                                        <tr>
                                                            <td style=3D"he=
ight: 20px; font-size: 1px; line-height: 1px;">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table widt=
h=3D"100%">
                                                                    <tbody>
                                                                        <tr=
>
                                                                           =
 <td style=3D"width: 20px;"></td>
                                                                           =
 <td valign=3D"top" style=3D"width: 50%;">
                                                                           =
     <table width=3D"100%">
                                                                           =
         <tbody>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"font-size: 18px; font-weight: 700; color: #1a=
1a1a;">
                                                                           =
                     Shared Inbox
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"height: 8px; font-size: 1px; line-height: 1px=
;">
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"font-size: 14px; color: #33353E; line-height:=
 1.5;">
                                                                           =
                     Handle every patient chat
                                                                           =
                     from one
                                                                           =
                     WhatsApp number, and
                                                                           =
                     assign each one to
                                                                           =
                     reception, dentists, or
                                                                           =
                     support staff, so no
                                                                           =
                     enquiry or follow-up
                                                                           =
                     gets missed.
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
         </tbody>
                                                                           =
     </table>
                                                                           =
 </td>
                                                                           =
 <td style=3D"width: 10px;"></td>
                                                                           =
 <td valign=3D"middle" align=3D"right" style=3D"width: 45%;">

                                                                           =
     <img src=3D"https://jiocampaigns.cdn.jio.com/pdjcmp/image_uploads/be14=
912896ec00f08578d8da59768bef5520003725dfe33756c2580aa058cab7_1783676444536_=
Payments_Mockup.png" width=3D"200" alt=3D"Shared Inbox" style=3D"display: b=
lock; border-radius: 8px;">
                                                                           =
 </td>
                                                                           =
 <td style=3D"width: 20px;"></td>
                                                                        </t=
r>
                                                                    </tbody=
>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style=3D"he=
ight: 20px; font-size: 1px; line-height: 1px;">
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td style=3D"width: 30px;"></td=
>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 20px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>



                        <tr>
                            <td>
                                <table width=3D"100%">
                                    <tbody>
                                        <tr>
                                            <td style=3D"width: 30px;"></td=
>
                                            <td>
                                                <table width=3D"100%">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <table widt=
h=3D"100%">
                                                                    <tbody>
                                                                        <tr=
>
                                                                           =
 <td valign=3D"middle" align=3D"left" style=3D"width: 45%;">

                                                                           =
     <img src=3D"https://jiocampaigns.cdn.jio.com/pdjcmp/image_uploads/29eb=
4a96155dae42118854b697c79434d15f293d96b8ab323928eb3b2816d8ae_1783676503727_=
0f9d321bcfeee316cbb13990f407dea7440ec609.png" width=3D"200" alt=3D"No-Code =
Bot Builder" style=3D"display: block; border-radius: 8px;">
                                                                           =
 </td>
                                                                           =
 <td style=3D"width: 15px;"></td>
                                                                           =
 <td valign=3D"top" style=3D"width: 50%;">
                                                                           =
     <table width=3D"100%">
                                                                           =
         <tbody>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"font-size: 18px; font-weight: 700; color: #1a=
1a1a;">
                                                                           =
                     No-Code Bot Builder
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"height: 8px; font-size: 1px; line-height: 1px=
;">
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"font-size: 14px; color: #33353E; line-height:=
 1.5;">
                                                                           =
                     A bot that answers common
                                                                           =
                     questions,
                                                                           =
                     captures appointment
                                                                           =
                     requests, and shares
                                                                           =
                     clinic timings, even
                                                                           =
                     outside working hours.
                                                                           =
                     It is live in hours.
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
         </tbody>
                                                                           =
     </table>
                                                                           =
 </td>
                                                                        </t=
r>
                                                                    </tbody=
>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td style=3D"width: 30px;"></td=
>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 20px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>



                        <tr>
                            <td>
                                <table width=3D"100%">
                                    <tbody>
                                        <tr>
                                            <td style=3D"width: 30px;"></td=
>
                                            <td>
                                                <table width=3D"100%" style=
=3D"background-color: #F5F0FF; border-radius: 12px;">
                                                    <tbody>
                                                        <tr>
                                                            <td style=3D"he=
ight: 20px; font-size: 1px; line-height: 1px;">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table widt=
h=3D"100%">
                                                                    <tbody>
                                                                        <tr=
>
                                                                           =
 <td style=3D"width: 20px;"></td>
                                                                           =
 <td valign=3D"top" style=3D"width: 50%;">
                                                                           =
     <table width=3D"100%">
                                                                           =
         <tbody>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"font-size: 18px; font-weight: 700; color: #1a=
1a1a;">
                                                                           =
                     Broadcast Campaigns
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"height: 8px; font-size: 1px; line-height: 1px=
;">
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"font-size: 14px; color: #33353E; line-height:=
 1.5;">
                                                                           =
                     Send check-up reminders,
                                                                           =
                     oral-care tips,
                                                                           =
                     clinic updates, and
                                                                           =
                     personalised offers
                                                                           =
                     based on patient
                                                                           =
                     needs.
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
         </tbody>
                                                                           =
     </table>
                                                                           =
 </td>
                                                                           =
 <td style=3D"width: 10px;"></td>
                                                                           =
 <td valign=3D"middle" align=3D"right" style=3D"width: 45%;">

                                                                           =
     <img src=3D"https://jiocampaigns.cdn.jio.com/pdjcmp/image_uploads/29eb=
4a96155dae42118854b697c79434d15f293d96b8ab323928eb3b2816d8ae_1783676503727_=
0f9d321bcfeee316cbb13990f407dea7440ec609.png" width=3D"200" alt=3D"Broadcas=
t Campaigns" style=3D"display: block; border-radius: 8px;">
                                                                           =
 </td>
                                                                           =
 <td style=3D"width: 20px;"></td>
                                                                        </t=
r>
                                                                    </tbody=
>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style=3D"he=
ight: 20px; font-size: 1px; line-height: 1px;">
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td style=3D"width: 30px;"></td=
>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 20px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>



                        <tr>
                            <td>
                                <table width=3D"100%">
                                    <tbody>
                                        <tr>
                                            <td style=3D"width: 30px;"></td=
>
                                            <td>
                                                <table width=3D"100%">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <table widt=
h=3D"100%">
                                                                    <tbody>
                                                                        <tr=
>
                                                                           =
 <td valign=3D"middle" align=3D"left" style=3D"width: 45%;">

                                                                           =
     <img src=3D"https://jiocampaigns.cdn.jio.com/pdjcmp/image_uploads/2d39=
9d326bb3c2fb7339b72ef9e9581f828733ae52cc906be2fd74db8cf04c5c_1783676631161_=
d1f8ef386a99e158807c673e8f03203fd5511b6b.png" width=3D"200" alt=3D"WhatsApp=
 CRM" style=3D"display: block; border-radius: 8px;">
                                                                           =
 </td>
                                                                           =
 <td style=3D"width: 15px;"></td>
                                                                           =
 <td valign=3D"top" style=3D"width: 50%;">
                                                                           =
     <table width=3D"100%">
                                                                           =
         <tbody>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"font-size: 18px; font-weight: 700; color: #1a=
1a1a;">
                                                                           =
                     WhatsApp CRM
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"height: 8px; font-size: 1px; line-height: 1px=
;">
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
             <tr>
                                                                           =
                 <td style=3D"font-size: 14px; color: #33353E; line-height:=
 1.5;">
                                                                           =
                     Turn WhatsApp chats into
                                                                           =
                     long-term
                                                                           =
                     patient relationships.
                                                                           =
                     Track appointments,
                                                                           =
                     treatment follow-ups,
                                                                           =
                     and recall dates, right
                                                                           =
                     inside the same chat.
                                                                           =
                 </td>
                                                                           =
             </tr>
                                                                           =
         </tbody>
                                                                           =
     </table>
                                                                           =
 </td>
                                                                        </t=
r>
                                                                    </tbody=
>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td style=3D"width: 30px;"></td=
>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style=3D"height: 40px; font-size: 1px; line=
-height: 1px;"></td>
                        </tr>



                        <tr>
                            <td style=3D"background-color: #EFEFEF;">
                                <table width=3D"100%">

                                    <tbody>
                                        <tr>
                                            <td style=3D"height: 40px; font=
-size: 1px; line-height: 1px;"></td>
                                        </tr>

                                        <tr>
                                            <td align=3D"center">
                                                <table width=3D"100%">
                                                    <tbody>
                                                        <tr>
                                                            <td style=3D"wi=
dth: 40px;"></td>
                                                            <td align=3D"ce=
nter" style=3D"font-size: 18px; font-weight: bold; color: #1a1a1a; line-hei=
ght: 1.4;">
                                                                Ready to tu=
rn more WhatsApp chats into confirmed appointments?
                                                            </td>
                                                            <td style=3D"wi=
dth: 40px;"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style=3D"height: 10px; font=
-size: 1px; line-height: 1px;"></td>
                                        </tr>

                                        <tr>
                                            <td align=3D"center" style=3D"f=
ont-size: 14px; color: #33353E; line-height: 1.5;">
                                                Talk to a JioCX specialist =
and see how it works for your dental clinic
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style=3D"height: 24px; font=
-size: 1px; line-height: 1px;"></td>
                                        </tr>

                                        <tr>
                                            <td align=3D"center">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td align=3D"ce=
nter">
                                                                <a href=3D"=
https://email.jiocx.com/web/v1/ctr/v2/s7bqOWQWGRwDdQ8iseOVU9Qyl1RZKDtYKxvQI=
6i4BMdeFmAo3BhJ-7OX8cgjvkp2ngkVB48Ss1wKZRmOdF_uXAKn3qGXvxSlxUIIQO4V2LNaZCWW=
MZvHJUf1k2q1gIOtbbFtm7fBG8wqEpVMIW686_u3cgHYir0fCu1BtnD5dCxRe90bLsCmsrwc792=
r9SeFGL9HEsT3mF96EQXyZKxX00Y4Gw7EiTlr-161PRmYxMpy83thToqqS9kFNDaw5VvXSHsaPS=
VdbsKHeo1LZzGpK8gZ9UveSrye6N0h5E6mDgPt-9QQ7c-1yYntkgPW3OUIAHMCp0p2nCP8G8qZP=
6bTmRv_BjyhtPLPsas4UqIDi4jLPiBRdfuF2smSxuFxj6pYIUOEnWBz-iTUG1rqP3nG6ugW8Tk3=
iz_riWPYFhWie0rcp19e7S9sKePPJqIlBgmXhcTTqa6-GlVe96sKNpsTiN7674fZNbQFXBsRiGX=
RCQKk5mRPXILeQfa7Q8YDopGXSeAuUTbgruKpPuqyLRVnvd82cfZ5E7rzWbJU06XmQmOd4m8EI3=
mHJHwwF4My0onKoE1HUx2lzRSfHtaLlxShjhA=3D" style=3D"display: inline-block; t=
ext-decoration: none;" rel=3D"nofollow">
                                                                    <img sr=
c=3D"https://jiocampaigns.cdn.jio.com/pdjcmp/image_uploads/a9db02c7f9e03005=
ae62c0c53188e7dae53e8998a4cc5ba4405f7534acc748b9_1783681303221_Frame_(2).pn=
g" width=3D"150" height=3D"44" alt=3D"Request a Demo" style=3D"display: blo=
ck; border: 0; outline: none; text-decoration: none;">
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style=3D"height: 40px; font=
-size: 1px; line-height: 1px;"></td>
                                        </tr>

                                        <tr>
                                            <td align=3D"center">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td align=3D"ce=
nter">
                                                                <img src=3D=
"https://jiocampaigns.cdn.jio.com/pdjcmp/image_uploads/6f4261c8d75246569f79=
3dde9ab16018ca0e7846d3899c73ea9106ebb41a3a36_1783681790621_ps_jiocx.png" wi=
dth=3D"36" height=3D"36" alt=3D"JioCX Logo" style=3D"display: block;">
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style=3D"height: 10px; font=
-size: 1px; line-height: 1px;"></td>
                                        </tr>

                                        <tr>
                                            <td align=3D"center">
                                                <a href=3D"https://email.ji=
ocx.com/web/v1/ctr/v2/3Us3fTc4A6WGuLQAKS5aQlAlZp_QhCwkcELNw-y3IEx-js3199YRh=
WcJady8jBjoitcARp8FZ_lNbtGB1lRsFxMiXR1AMNYOaEEu8pU_o6HHPtq5_ZklRdNEkCqk3t_m=
Mr5Mhl9lxm_3fc8tgOqsU3h3i1tXfBmkozkQ1HKVd6-i99BX1A_FYn87j3YhGMq7yy-w6YQN5PU=
IVA3gCv3YerRuU_yPNf4l_y3Y22mYk9Hg3a78yUduQWmUbk-LsFVzpjvb49hg_qJk6N7TcGOBLX=
cTpD6Ew3mPnZ2uBtmayVvplRNp_PSlYG1cELLL746Pa0PcSbcf3nmUD1Q1FwZjaV5NUd9aA1pSN=
R7Fgxd96weEidDHeAcG9vuJivi6qtLPrT6Dicx9-fjr11lQZKCxyVZOod89NRcbDd1RwFvh64QV=
y68UEwmiX60XxYYT-lEUITCPizC_Q5Xy3s7fpz2-2_uuUgk4aT901-LZ4Kz8iVPMSfqsiyhTx5C=
UlmWDm9u5ADocYnvmv8OcKz6I20VDM_-Y0Kf9DrI5gxGV2baHuHlxCe7vqpuScPTjDR0kY7crW3=
ERPWjtsD2RM_AVIZU02A_Uf1CuSotimHPxx6Y2UlVyIxfr_apEZfzjRQsBf4AGYEBzO2Wo242ac=
w5mRNKndg=3D=3D" style=3D"font-size: 14px; font-weight: bold; color: #1a1a1=
a; text-decoration: underline;" rel=3D"nofollow">
                                                    www.jiocx.com
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style=3D"height: 16px; font=
-size: 1px; line-height: 1px;"></td>
                                        </tr>

                                        <tr>
                                            <td align=3D"center" style=3D"f=
ont-size: 14px; color: #33353E; line-height: 1.5;">
                                                Call: +91-8169930507 | Emai=
l: hello@jiocx.com
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style=3D"height: 8px; font-=
size: 1px; line-height: 1px;"></td>
                                        </tr>

                                        <tr>
                                            <td align=3D"center" style=3D"f=
ont-size: 14px; color: #292929;">
                                                Copyright =C2=A9 2026 Jio T=
hings Ltd. All rights reserved.
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style=3D"height: 30px; font=
-size: 1px; line-height: 1px;"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table><table style=3D"width: 100%"> <tr> <td align=3D"center"> <p style=
=3D"font-size:10px;">No longer want to receive these email? <a href=3D"http=
s://email.jiocx.com/unsubscribe.html?data=3Df6ljvyyrkcJ4t2wVtgSZM4C5IODlIcC=
lFeUulipLFOvXs3rOOSQYP11L-DI1ZSa6-fKQy6PFESnRjDo7wsTJq_8NGp2E_TwgzYduPmJxSY=
ZfeQqmN_arnfX5M1FpmtBzZy5ZIPh18_5d_lOXo6tZ_L1QlAWx0quCHTobKnWzVu7TqAtCdge1-=
XKwNx2uYDZrHXCXkofCnUKLs6oM_82gB1Dn7uiinzUoe2QhSQVj_uXB1dnfroqG5XNRFPk9&amp=
;emailTo=3Dlinux-firmware%40kernel.org&amp;list=3Dmaster&amp;reasonID=3D0">=
Unsubscribe</a> </p> </td> </tr> </table><div style=3D'display: none;'><img=
 src=3D'https://email.jiocx.com/web/v1/openTracking?ampRendered=3Dfalse&cam=
paignId=3D16536&messageId=3D%3Cjiocxmarketing254%2F16536%2F570046%2F210666b=
4-a5f0-11f1-92f4-3e7309ddcc96%2Fcampaign%2Finfo%40jiocx.info%3E&sentAt=3D20=
26-09-01T16%3A00%3A16%2B05%3A30&toEmail=3Dlinux-firmware%40kernel.org' alt=
=3D''/></div>
--cbd5fc46da277f47573dbed1de5adbe4d9120b8d1e3df22b0ac596d3342c--
